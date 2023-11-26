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
import 'transports_list_page_model.dart';
export 'transports_list_page_model.dart';

class TransportsListPageWidget extends StatefulWidget {
  const TransportsListPageWidget({super.key});

  @override
  _TransportsListPageWidgetState createState() =>
      _TransportsListPageWidgetState();
}

class _TransportsListPageWidgetState extends State<TransportsListPageWidget> {
  late TransportsListPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TransportsListPageModel());
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
              '2gn12uuw' /* Transports */,
            ),
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
                          ..complete(HaulageCompanyAPIGroup
                              .getAllTransportOperationsCall
                              .call(
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
                  final listViewGetAllTransportOperationsResponse =
                      snapshot.data!;
                  return Builder(
                    builder: (context) {
                      final transportsList = HaulageCompanyAPIGroup
                              .getAllTransportOperationsCall
                              .rootList(
                                listViewGetAllTransportOperationsResponse
                                    .jsonBody,
                              )
                              ?.map((e) => e != null && e != ''
                                  ? TransportOperationDTOStruct.fromMap(e)
                                  : null)
                              .withoutNulls
                              .toList()
                              ?.toList() ??
                          [];
                      if (transportsList.isEmpty) {
                        return const Center(
                          child: EmptyListWidget(),
                        );
                      }
                      return RefreshIndicator(
                        onRefresh: () async {
                          setState(() => _model.apiRequestCompleter = null);
                          await _model.waitForApiRequestCompleted();
                        },
                        child: ListView.separated(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount: transportsList.length,
                          separatorBuilder: (_, __) => const SizedBox(height: 10.0),
                          itemBuilder: (context, transportsListIndex) {
                            final transportsListItem =
                                transportsList[transportsListIndex];
                            return Container(
                              decoration: const BoxDecoration(),
                              child: ExpandableNotifier(
                                child: ExpandablePanel(
                                  header: Text(
                                    valueOrDefault<String>(
                                      transportsListItem.id.toString(),
                                      'id',
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).titleLarge,
                                  ),
                                  collapsed: Container(),
                                  expanded: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10.0, 10.0, 10.0, 10.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '0xavmslk' /* Date */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontStyle: FontStyle.italic,
                                              ),
                                        ),
                                        Text(
                                          dateTimeFormat(
                                            'yMMMd',
                                            transportsListItem.date!,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge,
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '64v251nc' /* Order */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontStyle: FontStyle.italic,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'msy78n8t' /* Shop */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontStyle:
                                                              FontStyle.italic,
                                                        ),
                                              ),
                                              Text(
                                                transportsListItem
                                                    .orderDTO.shopDTO.name,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge,
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'sf7rzy9b' /* Goods */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontStyle:
                                                              FontStyle.italic,
                                                        ),
                                              ),
                                              Builder(
                                                builder: (context) {
                                                  final goodsList =
                                                      transportsListItem
                                                          .orderDTO.goodDTOs
                                                          .toList();
                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount: goodsList.length,
                                                    itemBuilder: (context,
                                                        goodsListIndex) {
                                                      final goodsListItem =
                                                          goodsList[
                                                              goodsListIndex];
                                                      return Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                        ),
                                                        child: Text(
                                                          'x${goodsListItem.quantity.toString()} ${goodsListItem.goodDTO.name}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '7ioqn1to' /* Vehicles */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontStyle: FontStyle.italic,
                                              ),
                                        ),
                                        Builder(
                                          builder: (context) {
                                            final vehiclesList =
                                                transportsListItem
                                                    .usedVehicleDTOs
                                                    .toList();
                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: vehiclesList.length,
                                              itemBuilder:
                                                  (context, vehiclesListIndex) {
                                                final vehiclesListItem =
                                                    vehiclesList[
                                                        vehiclesListIndex];
                                                return Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                  ),
                                                  child: Text(
                                                    vehiclesListItem
                                                        .licensePlate,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge,
                                                  ),
                                                );
                                              },
                                            );
                                          },
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
                                                Icons.edit,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24.0,
                                              ),
                                              onPressed: () async {
                                                context.pushNamed(
                                                  'TransportForm',
                                                  queryParameters: {
                                                    'isExisting':
                                                        serializeParam(
                                                      true,
                                                      ParamType.bool,
                                                    ),
                                                    'transportOperationJSON':
                                                        serializeParam(
                                                      transportsListItem
                                                          .toMap(),
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
                                                        .deleteTransportOperationCall
                                                        .call(
                                                  bearerAuth:
                                                      currentAuthenticationToken,
                                                  id: transportsListItem.id,
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
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Failed to delete transport',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                      ),
                                                      duration: const Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                    ),
                                                  );
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
                        'TransportForm',
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
