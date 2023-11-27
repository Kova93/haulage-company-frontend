import 'package:format/format.dart';
import 'package:haulage_company/util/show_error_snack_bar.dart';
import 'package:haulage_company/util/string_capitalize.dart';

import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/add_good_to_location_dialog/add_good_to_location_dialog_widget.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/backend/schema/structs/index.dart';
import 'dart:async';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'location_details_model.dart';
export 'location_details_model.dart';

class LocationDetailsWidget extends StatefulWidget {
  const LocationDetailsWidget({
    super.key,
    required this.locationId,
  });

  final int? locationId;

  @override
  _LocationDetailsWidgetState createState() => _LocationDetailsWidgetState();
}

class _LocationDetailsWidgetState extends State<LocationDetailsWidget>
    with TickerProviderStateMixin {
  late LocationDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LocationDetailsModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
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

    return FutureBuilder<ApiCallResponse>(
      future: (_model.apiRequestCompleter ??= Completer<ApiCallResponse>()
            ..complete(HaulageCompanyAPIGroup.getLocationByIdCall.call(
              bearerAuth: currentAuthenticationToken,
              id: widget.locationId,
            )))
          .future,
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final locationDetailsGetLocationByIdResponse = snapshot.data!;
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
                valueOrDefault<String>(
                  (locationDetailsGetLocationByIdResponse.jsonBody != null &&
                              locationDetailsGetLocationByIdResponse.jsonBody !=
                                  ''
                          ? LorrySiteDTOStruct.fromMap(
                              locationDetailsGetLocationByIdResponse.jsonBody)
                          : null)
                      ?.name,
                  FFLocalizations.of(context).getText(
                    'entities.location'
                  ).capitalize(),
                ),
                style: FlutterFlowTheme.of(context).headlineLarge,
              ),
              actions: const [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                children: [
                  Expanded(
                    child: TabBarView(
                      controller: _model.tabBarController,
                      children: [
                        KeepAliveWidgetWrapper(
                          builder: (context) => Stack(
                            children: [
                              Builder(
                                builder: (context) {
                                  final vehiclesList =
                                      (locationDetailsGetLocationByIdResponse
                                                              .jsonBody !=
                                                          null &&
                                                      locationDetailsGetLocationByIdResponse
                                                              .jsonBody !=
                                                          ''
                                                  ? LorrySiteDTOStruct.fromMap(
                                                      locationDetailsGetLocationByIdResponse
                                                          .jsonBody)
                                                  : null)
                                              ?.vehicleDTOs
                                              .toList() ??
                                          [];
                                  return RefreshIndicator(
                                    onRefresh: () async {
                                      setState(() =>
                                          _model.apiRequestCompleter = null);
                                      await _model.waitForApiRequestCompleted();
                                    },
                                    child: vehiclesList.isEmpty
                                      ? const EmptyListWidget()
                                      : ListView.separated(
                                          padding: EdgeInsets.zero,
                                          scrollDirection: Axis.vertical,
                                          itemCount: vehiclesList.length,
                                          separatorBuilder: (_, __) =>
                                              const SizedBox(height: 10.0),
                                          itemBuilder:
                                              (context, vehiclesListIndex) {
                                            final vehiclesListItem =
                                                vehiclesList[vehiclesListIndex];
                                            return Container(
                                              decoration: const BoxDecoration(),
                                              child: ExpandableNotifier(
                                                child: ExpandablePanel(
                                                  header: Text(
                                                    vehiclesListItem.licensePlate,
                                                    style:
                                                        FlutterFlowTheme.of(context)
                                                            .titleLarge,
                                                  ),
                                                  collapsed: Container(),
                                                  expanded: Padding(
                                                    padding: const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            10.0, 10.0, 10.0, 10.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'attributes.common.size',
                                                          ).capitalize(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                fontStyle: FontStyle
                                                                    .italic,
                                                              ),
                                                        ),
                                                        Text(
                                                          '${vehiclesListItem.size.toString()} m3',
                                                          style:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge,
                                                        ),
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'attributes.vehicle.maxWeight',
                                                          ).capitalize(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                fontStyle: FontStyle
                                                                    .italic,
                                                              ),
                                                        ),
                                                        Text(
                                                          '${vehiclesListItem.maxWeight.toString()} kg',
                                                          style:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge,
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment.end,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            FlutterFlowIconButton(
                                                              borderColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              borderRadius: 8.0,
                                                              borderWidth: 1.0,
                                                              buttonSize: 40.0,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent1,
                                                              icon: Icon(
                                                                Icons.edit,
                                                                color: FlutterFlowTheme
                                                                        .of(context)
                                                                    .primaryText,
                                                                size: 24.0,
                                                              ),
                                                              onPressed: () async {
                                                                context.pushNamed(
                                                                  'VehicleForm',
                                                                  queryParameters: {
                                                                    'isExisting':
                                                                        serializeParam(
                                                                      true,
                                                                      ParamType
                                                                          .bool,
                                                                    ),
                                                                    'vehicleJSON':
                                                                        serializeParam(
                                                                      vehiclesListItem
                                                                          .toMap(),
                                                                      ParamType
                                                                          .JSON,
                                                                    ),
                                                                    'locationID':
                                                                        serializeParam(
                                                                      widget
                                                                          .locationId,
                                                                      ParamType.int,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              },
                                                            ),
                                                            FlutterFlowIconButton(
                                                              borderColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              borderRadius: 8.0,
                                                              borderWidth: 1.0,
                                                              buttonSize: 40.0,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent1,
                                                              icon: Icon(
                                                                Icons.delete,
                                                                color: FlutterFlowTheme
                                                                        .of(context)
                                                                    .primaryText,
                                                                size: 24.0,
                                                              ),
                                                              onPressed: () async {
                                                                _model.deleteVehicleResult =
                                                                    await HaulageCompanyAPIGroup
                                                                        .deleteVehicleCall
                                                                        .call(
                                                                  bearerAuth:
                                                                      currentAuthenticationToken,
                                                                  id: vehiclesListItem
                                                                      .id,
                                                                );
                                                                if ((_model
                                                                        .deleteVehicleResult
                                                                        ?.succeeded ??
                                                                    true)) {
                                                                  setState(() =>
                                                                      _model.apiRequestCompleter =
                                                                          null);
                                                                  await _model
                                                                      .waitForApiRequestCompleted();
                                                                } else {
                                                                  showErrorSnackBar(context, FFLocalizations.of(context).getText(
                                                                      'errors.failure.delete'
                                                                  ).format(
                                                                      FFLocalizations.of(context).getText(
                                                                          'entities.vehicle'
                                                                      )
                                                                  ).capitalize());
                                                                }

                                                                setState(() {});
                                                              },
                                                            ),
                                                          ].divide(const SizedBox(
                                                              width: 10.0)),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  theme: ExpandableThemeData(
                                                    tapHeaderToExpand: true,
                                                    tapBodyToExpand: false,
                                                    tapBodyToCollapse: false,
                                                    headerAlignment:
                                                        ExpandablePanelHeaderAlignment
                                                            .center,
                                                    hasIcon: true,
                                                    iconColor:
                                                        FlutterFlowTheme.of(context)
                                                            .primaryText,
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                      ),
                                  );
                                },
                              ),
                              Align(
                                alignment: const AlignmentDirectional(1.00, 1.00),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10.0, 10.0, 10.0, 10.0),
                                  child: FlutterFlowIconButton(
                                    borderColor:
                                        FlutterFlowTheme.of(context).primary,
                                    borderRadius: 8.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    fillColor:
                                        FlutterFlowTheme.of(context).accent1,
                                    icon: Icon(
                                      Icons.add,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      context.pushNamed(
                                        'VehicleForm',
                                        queryParameters: {
                                          'isExisting': serializeParam(
                                            false,
                                            ParamType.bool,
                                          ),
                                          'locationID': serializeParam(
                                            widget.locationId,
                                            ParamType.int,
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
                        KeepAliveWidgetWrapper(
                          builder: (context) => Stack(
                            children: [
                              Builder(
                                builder: (context) {
                                  final stackedGoodsList =
                                      (locationDetailsGetLocationByIdResponse
                                                              .jsonBody !=
                                                          null &&
                                                      locationDetailsGetLocationByIdResponse
                                                              .jsonBody !=
                                                          ''
                                                  ? LorrySiteDTOStruct.fromMap(
                                                      locationDetailsGetLocationByIdResponse
                                                          .jsonBody)
                                                  : null)
                                              ?.goodDTOs
                                              .toList() ??
                                          [];
                                  return RefreshIndicator(
                                    onRefresh: () async {
                                      setState(() =>
                                          _model.apiRequestCompleter = null);
                                      await _model.waitForApiRequestCompleted();
                                    },
                                    child: stackedGoodsList.isEmpty
                                      ? const EmptyListWidget()
                                      : ListView.separated(
                                          padding: EdgeInsets.zero,
                                          scrollDirection: Axis.vertical,
                                          itemCount: stackedGoodsList.length,
                                          separatorBuilder: (_, __) =>
                                              const SizedBox(height: 10.0),
                                          itemBuilder:
                                              (context, stackedGoodsListIndex) {
                                            final stackedGoodsListItem =
                                                stackedGoodsList[
                                                    stackedGoodsListIndex];
                                            return Container(
                                              decoration: const BoxDecoration(),
                                              child: ExpandableNotifier(
                                                child: ExpandablePanel(
                                                  header: Text(
                                                    stackedGoodsListItem
                                                        .goodDTO.name,
                                                    style:
                                                        FlutterFlowTheme.of(context)
                                                            .titleLarge,
                                                  ),
                                                  collapsed: Container(),
                                                  expanded: Padding(
                                                    padding: const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            10.0, 10.0, 10.0, 10.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'attributes.good.description',
                                                          ).capitalize(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                fontStyle: FontStyle
                                                                    .italic,
                                                              ),
                                                        ),
                                                        Text(
                                                          stackedGoodsListItem
                                                              .goodDTO.description,
                                                          style:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge,
                                                        ),
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'attributes.common.size',
                                                          ).capitalize(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                fontStyle: FontStyle
                                                                    .italic,
                                                              ),
                                                        ),
                                                        Text(
                                                          '${stackedGoodsListItem.goodDTO.size.toString()} m3',
                                                          style:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge,
                                                        ),
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'attributes.good.weight',
                                                          ).capitalize(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                fontStyle: FontStyle
                                                                    .italic,
                                                              ),
                                                        ),
                                                        Text(
                                                          '${stackedGoodsListItem.goodDTO.weight.toString()} kg',
                                                          style:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge,
                                                        ),
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'attributes.good.quantity',
                                                          ).capitalize(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                fontStyle: FontStyle
                                                                    .italic,
                                                              ),
                                                        ),
                                                        Text(
                                                          stackedGoodsListItem
                                                              .quantity
                                                              .toString(),
                                                          style:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  theme: ExpandableThemeData(
                                                    tapHeaderToExpand: true,
                                                    tapBodyToExpand: false,
                                                    tapBodyToCollapse: false,
                                                    headerAlignment:
                                                        ExpandablePanelHeaderAlignment
                                                            .center,
                                                    hasIcon: true,
                                                    iconColor:
                                                        FlutterFlowTheme.of(context)
                                                            .primaryText,
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                      ),
                                  );
                                },
                              ),
                              Align(
                                alignment: const AlignmentDirectional(1.00, 1.00),
                                child: Builder(
                                  builder: (context) => Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10.0, 10.0, 10.0, 10.0),
                                    child: FutureBuilder<ApiCallResponse>(
                                      future: HaulageCompanyAPIGroup
                                          .getAllGoodsCall
                                          .call(
                                        bearerAuth: currentAuthenticationToken,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        final addButtonGetAllGoodsResponse =
                                            snapshot.data!;
                                        return FlutterFlowIconButton(
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
                                            Icons.add,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                          onPressed: () async {
                                            await showAlignedDialog(
                                              barrierColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              context: context,
                                              isGlobal: true,
                                              avoidOverflow: true,
                                              targetAnchor:
                                                  const AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              followerAnchor:
                                                  const AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              builder: (dialogContext) => ScaffoldMessenger(
                                                child: Builder(
                                                  builder: (dialogContext) => Scaffold(
                                                    backgroundColor: Colors.transparent,
                                                    body: GestureDetector(
                                                      onTap: () => _model
                                                              .unfocusNode
                                                              .canRequestFocus
                                                          ? FocusScope.of(context)
                                                              .requestFocus(_model
                                                                  .unfocusNode)
                                                          : FocusScope.of(context)
                                                              .unfocus(),
                                                      child: AddGoodToLocationDialogWidget(
                                                        locationId:
                                                            widget.locationId!,
                                                        goods:
                                                            (HaulageCompanyAPIGroup
                                                                .getAllGoodsCall
                                                                .rootList(
                                                                  addButtonGetAllGoodsResponse
                                                                      .jsonBody,
                                                                ) as List?)
                                                                ?.map((e) => e !=
                                                                            null &&
                                                                        e != ''
                                                                    ? GoodDTOStruct
                                                                        .fromMap(
                                                                            e)
                                                                    : null)
                                                                .withoutNulls
                                                                .toList(),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ).then((value) => setState(() {}));
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: const Alignment(0.0, 0),
                    child: FlutterFlowButtonTabBar(
                      useToggleButtonStyle: true,
                      labelStyle: FlutterFlowTheme.of(context).titleMedium,
                      unselectedLabelStyle: const TextStyle(),
                      labelColor: FlutterFlowTheme.of(context).primaryText,
                      unselectedLabelColor:
                          FlutterFlowTheme.of(context).secondaryText,
                      backgroundColor: FlutterFlowTheme.of(context).accent1,
                      unselectedBackgroundColor:
                          FlutterFlowTheme.of(context).alternate,
                      borderColor: FlutterFlowTheme.of(context).primary,
                      unselectedBorderColor:
                          FlutterFlowTheme.of(context).alternate,
                      borderWidth: 2.0,
                      borderRadius: 8.0,
                      elevation: 0.0,
                      buttonMargin:
                          const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                      tabs: [
                        Tab(
                          text: FFLocalizations.of(context).getText(
                            'entities.vehicle.plural',
                          ).capitalize(),
                        ),
                        Tab(
                          text: FFLocalizations.of(context).getText(
                            'entities.good.plural',
                          ).capitalize(),
                        ),
                      ],
                      controller: _model.tabBarController,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
