import 'package:format/format.dart';
import 'package:haulage_company/util/show_error_snack_bar.dart';
import 'package:haulage_company/util/string_capitalize.dart';

import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/backend/schema/structs/index.dart';
import 'dart:async';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'locations_list_page_model.dart';
export 'locations_list_page_model.dart';

class LocationsListPageWidget extends StatefulWidget {
  const LocationsListPageWidget({super.key});

  @override
  _LocationsListPageWidgetState createState() =>
      _LocationsListPageWidgetState();
}

class _LocationsListPageWidgetState extends State<LocationsListPageWidget> {
  late LocationsListPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LocationsListPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).info,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'entities.location.plural',
            ).capitalize(),
            style: FlutterFlowTheme.of(context).headlineLarge,
          ),
          actions: const [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              FutureBuilder<ApiCallResponse>(
                future:
                    (_model.apiRequestCompleter ??= Completer<ApiCallResponse>()
                          ..complete(
                              HaulageCompanyAPIGroup.getAllLocationsCall.call(
                            bearerAuth: currentAuthenticationToken,
                          )))
                        .future,
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    );
                  }
                  final listViewGetAllLocationsResponse = snapshot.data!;
                  return Builder(
                    builder: (context) {
                      final locationsList = (HaulageCompanyAPIGroup
                              .getAllLocationsCall
                              .rootList(
                                listViewGetAllLocationsResponse.jsonBody,
                              ) as List?)
                              ?.map((e) => !(e ?? '').isEmpty
                                  ? LorrySiteDTOStruct.fromMap(e)
                                  : null)
                              .withoutNulls ??
                          [];
                      return RefreshIndicator(
                        onRefresh: () async {
                          setState(() => _model.apiRequestCompleter = null);
                          await _model.waitForApiRequestCompleted();
                        },
                        child: locationsList.isEmpty
                          ? const EmptyListWidget()
                          : ListView.separated(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.vertical,
                              itemCount: locationsList.length,
                              separatorBuilder: (_, __) => const SizedBox(height: 10.0),
                              itemBuilder: (context, locationsListIndex) {
                                final locationsListItem =
                                    locationsList[locationsListIndex];
                                return Container(
                                  decoration: const BoxDecoration(),
                                  child: ExpandableNotifier(
                                    child: ExpandablePanel(
                                      header: Text(
                                        locationsListItem.name,
                                        style:
                                            FlutterFlowTheme.of(context).titleLarge,
                                      ),
                                      collapsed: Container(),
                                      expanded: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 10.0, 10.0, 10.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Align(
                                              alignment:
                                                  const AlignmentDirectional(-1.00, 0.00),
                                              child: Text(
                                                FFLocalizations.of(context).getText(
                                                  'attributes.common.address',
                                                ).capitalize(),
                                                style: FlutterFlowTheme.of(context)
                                                    .labelLarge
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontStyle: FontStyle.italic,
                                                    ),
                                              ),
                                            ),
                                            Align(
                                              alignment:
                                                  const AlignmentDirectional(-1.00, 0.00),
                                              child: Text(
                                                locationsListItem.address,
                                                style: FlutterFlowTheme.of(context)
                                                    .bodyLarge,
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                FlutterFlowIconButton(
                                                  borderColor:
                                                      FlutterFlowTheme.of(context)
                                                          .primary,
                                                  borderRadius: 8.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 40.0,
                                                  fillColor:
                                                      FlutterFlowTheme.of(context)
                                                          .accent1,
                                                  icon: Icon(
                                                    Icons.info_outline,
                                                    color:
                                                        FlutterFlowTheme.of(context)
                                                            .primaryText,
                                                    size: 24.0,
                                                  ),
                                                  onPressed: () async {
                                                    context.pushNamed(
                                                      'LocationDetails',
                                                      queryParameters: {
                                                        'locationId':
                                                            serializeParam(
                                                          locationsListItem.id,
                                                          ParamType.int,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                ),
                                                FlutterFlowIconButton(
                                                  borderColor:
                                                      FlutterFlowTheme.of(context)
                                                          .primary,
                                                  borderRadius: 8.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 40.0,
                                                  fillColor:
                                                      FlutterFlowTheme.of(context)
                                                          .accent1,
                                                  icon: Icon(
                                                    Icons.edit,
                                                    color:
                                                        FlutterFlowTheme.of(context)
                                                            .primaryText,
                                                    size: 24.0,
                                                  ),
                                                  onPressed: () async {
                                                    context.pushNamed(
                                                      'LocationForm',
                                                      queryParameters: {
                                                        'isExisting':
                                                            serializeParam(
                                                          true,
                                                          ParamType.bool,
                                                        ),
                                                        'locationJSON':
                                                            serializeParam(
                                                          locationsListItem.toMap(),
                                                          ParamType.JSON,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                ),
                                                FlutterFlowIconButton(
                                                  borderColor:
                                                      FlutterFlowTheme.of(context)
                                                          .primary,
                                                  borderRadius: 8.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 40.0,
                                                  fillColor:
                                                      FlutterFlowTheme.of(context)
                                                          .accent1,
                                                  icon: Icon(
                                                    Icons.delete,
                                                    color:
                                                        FlutterFlowTheme.of(context)
                                                            .primaryText,
                                                    size: 24.0,
                                                  ),
                                                  onPressed: () async {
                                                    _model.deleteResult =
                                                        await HaulageCompanyAPIGroup
                                                            .deleteLocationCall
                                                            .call(
                                                      bearerAuth:
                                                          currentAuthenticationToken,
                                                      id: locationsListItem.id,
                                                    );
                                                    if ((_model.deleteResult
                                                            ?.succeeded ??
                                                        true)) {
                                                      setState(() => _model
                                                              .apiRequestCompleter =
                                                          null);
                                                      await _model
                                                          .waitForApiRequestCompleted();
                                                    } else {
                                                      showErrorSnackBar(context, FFLocalizations.of(context).getText(
                                                          'errors.failure.delete'
                                                      ).format(
                                                          FFLocalizations.of(context).getText(
                                                              'entities.location'
                                                          )
                                                      ).capitalize());
                                                    }

                                                    setState(() {});
                                                  },
                                                ),
                                              ].divide(const SizedBox(width: 10.0)),
                                            ),
                                          ],
                                        ),
                                      ),
                                      theme: ExpandableThemeData(
                                        tapHeaderToExpand: true,
                                        tapBodyToExpand: false,
                                        tapBodyToCollapse: false,
                                        headerAlignment:
                                            ExpandablePanelHeaderAlignment.center,
                                        hasIcon: true,
                                        iconColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                  ),
                                );
                              },
                          ),
                      );
                    },
                  );
                },
              ),
              Align(
                alignment: const AlignmentDirectional(1.00, 1.00),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                  child: FlutterFlowIconButton(
                    borderColor: FlutterFlowTheme.of(context).primary,
                    borderRadius: 8.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).accent1,
                    icon: Icon(
                      Icons.add,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      context.pushNamed(
                        'LocationForm',
                        queryParameters: {
                          'isExisting': serializeParam(
                            false,
                            ParamType.bool,
                          ),
                        }.withoutNulls,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
