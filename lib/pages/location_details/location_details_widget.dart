import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/add_quantity_dialog/add_quantity_dialog_widget.dart';
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
              bearerAuth: currentUserData?.accessToken,
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
                  'Location',
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
                                  if (vehiclesList.isEmpty) {
                                    return const Center(
                                      child: EmptyListWidget(),
                                    );
                                  }
                                  return RefreshIndicator(
                                    onRefresh: () async {
                                      setState(() =>
                                          _model.apiRequestCompleter = null);
                                      await _model.waitForApiRequestCompleted();
                                    },
                                    child: ListView.separated(
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
                                              expanded: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'i2j9a9p5' /* Size */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontStyle:
                                                              FontStyle.italic,
                                                        ),
                                                  ),
                                                  Text(
                                                    '${vehiclesListItem.size.toString()}m3',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge,
                                                  ),
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'zhemtemq' /* Max weight */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontStyle:
                                                              FontStyle.italic,
                                                        ),
                                                  ),
                                                  Text(
                                                    '${vehiclesListItem.maxWeight.toString()}kg',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10.0,
                                                                10.0,
                                                                10.0,
                                                                10.0),
                                                    child: Row(
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
                                                                  currentUserData
                                                                      ?.accessToken,
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
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'Failed to delete vehicle',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                        ),
                                                                  ),
                                                                  duration: const Duration(
                                                                      milliseconds:
                                                                          4000),
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
                                                      ].divide(const SizedBox(
                                                          width: 10.0)),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              theme: const ExpandableThemeData(
                                                tapHeaderToExpand: true,
                                                tapBodyToExpand: false,
                                                tapBodyToCollapse: false,
                                                headerAlignment:
                                                    ExpandablePanelHeaderAlignment
                                                        .center,
                                                hasIcon: true,
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
                                  final goodsList =
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
                                  if (goodsList.isEmpty) {
                                    return const Center(
                                      child: EmptyListWidget(),
                                    );
                                  }
                                  return RefreshIndicator(
                                    onRefresh: () async {
                                      setState(() =>
                                          _model.apiRequestCompleter = null);
                                      await _model.waitForApiRequestCompleted();
                                    },
                                    child: ListView.separated(
                                      padding: EdgeInsets.zero,
                                      scrollDirection: Axis.vertical,
                                      itemCount: goodsList.length,
                                      separatorBuilder: (_, __) =>
                                          const SizedBox(height: 10.0),
                                      itemBuilder: (context, goodsListIndex) {
                                        final goodsListItem =
                                            goodsList[goodsListIndex];
                                        return Container(
                                          decoration: const BoxDecoration(),
                                          child: ExpandableNotifier(
                                            child: ExpandablePanel(
                                              header: Text(
                                                goodsListItem.name,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge,
                                              ),
                                              collapsed: Container(),
                                              expanded: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '1d2hpj62' /* Description */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontStyle:
                                                              FontStyle.italic,
                                                        ),
                                                  ),
                                                  Text(
                                                    goodsListItem.description,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge,
                                                  ),
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'yhvofjt3' /* Size */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontStyle:
                                                              FontStyle.italic,
                                                        ),
                                                  ),
                                                  Text(
                                                    '${goodsListItem.size.toString()}m3',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge,
                                                  ),
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'xtwc8hqd' /* Weight */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontStyle:
                                                              FontStyle.italic,
                                                        ),
                                                  ),
                                                  Text(
                                                    goodsListItem.weight
                                                        .toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge,
                                                  ),
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'f476pkes' /* Quantity */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontStyle:
                                                              FontStyle.italic,
                                                        ),
                                                  ),
                                                  Text(
                                                    goodsListItem.quantity
                                                        .toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10.0,
                                                                10.0,
                                                                10.0,
                                                                10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Builder(
                                                          builder: (context) =>
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
                                                              Icons
                                                                  .shopping_cart,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 24.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              await showAlignedDialog(
                                                                barrierColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent4,
                                                                context:
                                                                    context,
                                                                isGlobal: true,
                                                                avoidOverflow:
                                                                    false,
                                                                targetAnchor:
                                                                    const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0)
                                                                        .resolve(
                                                                            Directionality.of(context)),
                                                                followerAnchor:
                                                                    const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0)
                                                                        .resolve(
                                                                            Directionality.of(context)),
                                                                builder:
                                                                    (dialogContext) {
                                                                  return Material(
                                                                    color: Colors
                                                                        .transparent,
                                                                    child:
                                                                        GestureDetector(
                                                                      onTap: () => _model
                                                                              .unfocusNode
                                                                              .canRequestFocus
                                                                          ? FocusScope.of(context).requestFocus(_model
                                                                              .unfocusNode)
                                                                          : FocusScope.of(context)
                                                                              .unfocus(),
                                                                      child:
                                                                          AddQuantityDialogWidget(
                                                                        goodParam:
                                                                            goodsListItem,
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  setState(
                                                                      () {}));
                                                            },
                                                          ),
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
                                                            _model.deleteGoodResult =
                                                                await HaulageCompanyAPIGroup
                                                                    .deleteGoodCall
                                                                    .call(
                                                              bearerAuth:
                                                                  currentUserData
                                                                      ?.accessToken,
                                                              id: goodsListItem
                                                                  .id,
                                                            );
                                                            if ((_model
                                                                    .deleteGoodResult
                                                                    ?.succeeded ??
                                                                true)) {
                                                              setState(() =>
                                                                  _model.apiRequestCompleter =
                                                                      null);
                                                              await _model
                                                                  .waitForApiRequestCompleted();
                                                            } else {
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'Failed to delete good',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                        ),
                                                                  ),
                                                                  duration: const Duration(
                                                                      milliseconds:
                                                                          4000),
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
                                                      ].divide(const SizedBox(
                                                          width: 10.0)),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              theme: const ExpandableThemeData(
                                                tapHeaderToExpand: true,
                                                tapBodyToExpand: false,
                                                tapBodyToCollapse: false,
                                                headerAlignment:
                                                    ExpandablePanelHeaderAlignment
                                                        .center,
                                                hasIcon: true,
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
                                        'GoodForm',
                                        queryParameters: {
                                          'isExisting': serializeParam(
                                            false,
                                            ParamType.bool,
                                          ),
                                          'lorrySiteID': serializeParam(
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
                            '532l404n' /* Vehicles */,
                          ),
                        ),
                        Tab(
                          text: FFLocalizations.of(context).getText(
                            '6okyo9mm' /* Goods */,
                          ),
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
