import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/add_good_dialog/add_good_dialog_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'order_form_model.dart';
export 'order_form_model.dart';

class OrderFormWidget extends StatefulWidget {
  const OrderFormWidget({
    super.key,
    required this.isExisting,
    this.getOrderJSON,
  });

  final bool? isExisting;
  final dynamic getOrderJSON;

  @override
  _OrderFormWidgetState createState() => _OrderFormWidgetState();
}

class _OrderFormWidgetState extends State<OrderFormWidget> {
  late OrderFormModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrderFormModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.getOrderJSON != null) {
        setState(() {
          _model.getOrder =
              widget.getOrderJSON != null && widget.getOrderJSON != ''
                  ? GetOrderDTOStruct.fromMap(widget.getOrderJSON)
                  : null;
        });
      } else {
        setState(() {
          _model.getOrder = GetOrderDTOStruct();
        });
      }
    });
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

    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: HaulageCompanyAPIGroup.getAllShopsCall.call(),
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
        final orderFormGetAllShopsResponse = snapshot.data!;
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
                widget.isExisting! ? 'Edit order' : 'Add order',
                style: FlutterFlowTheme.of(context).headlineLarge,
              ),
              actions: const [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: FutureBuilder<ApiCallResponse>(
                future: HaulageCompanyAPIGroup.getAllGoodsCall.call(),
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
                  final formGetAllGoodsResponse = snapshot.data!;
                  return Form(
                    key: _model.formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          10.0, 10.0, 10.0, 10.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            FlutterFlowDropDown<String>(
                              controller: _model.shopDropDownValueController ??=
                                  FormFieldController<String>(
                                _model.shopDropDownValue ??=
                                    _model.getOrder?.shopDTO.name,
                              ),
                              options: (HaulageCompanyAPIGroup.getAllShopsCall
                                      .rootList(
                                orderFormGetAllShopsResponse.jsonBody,
                              ) as List)
                                  .map<String>((s) => s.toString())
                                  .toList().map((e) => (e != ''
                                          ? ShopDTOStruct.fromMap(e)
                                          : null)
                                      ?.name)
                                  .withoutNulls
                                  .toList(),
                              onChanged: (val) => setState(
                                  () => _model.shopDropDownValue = val),
                              textStyle: FlutterFlowTheme.of(context).bodyLarge,
                              hintText: FFLocalizations.of(context).getText(
                                'k2oormpx' /* Select shop... */,
                              ),
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 2.0,
                              borderColor:
                                  FlutterFlowTheme.of(context).alternate,
                              borderWidth: 2.0,
                              borderRadius: 8.0,
                              margin: const EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 10.0, 0.0),
                              hidesUnderline: true,
                              isSearchable: false,
                              isMultiSelect: false,
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                'joiwknvl' /* Goods */,
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
                                final goodsList =
                                    _model.getOrder?.goodDTOs.toList() ?? [];
                                return ListView.separated(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: goodsList.length,
                                  separatorBuilder: (_, __) =>
                                      const SizedBox(height: 10.0),
                                  itemBuilder: (context, goodsListIndex) {
                                    final goodsListItem =
                                        goodsList[goodsListIndex];
                                    return Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            goodsListItem.name,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge,
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
                                              setState(() {
                                                _model.updateGetOrderStruct(
                                                  (e) => e
                                                    ..updateGoodDTOs(
                                                      (e) => e.removeAt(
                                                          goodsListIndex),
                                                    ),
                                                );
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                            Builder(
                              builder: (context) => FFButtonWidget(
                                onPressed: () async {
                                  await showAlignedDialog(
                                    barrierColor:
                                        FlutterFlowTheme.of(context).accent4,
                                    context: context,
                                    isGlobal: true,
                                    avoidOverflow: false,
                                    targetAnchor: const AlignmentDirectional(0.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                    followerAnchor: const AlignmentDirectional(
                                            0.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                    builder: (dialogContext) {
                                      return Material(
                                        color: Colors.transparent,
                                        child: GestureDetector(
                                          onTap: () => _model
                                                  .unfocusNode.canRequestFocus
                                              ? FocusScope.of(context)
                                                  .requestFocus(
                                                      _model.unfocusNode)
                                              : FocusScope.of(context)
                                                  .unfocus(),
                                          child: AddGoodDialogWidget(
                                            goods: HaulageCompanyAPIGroup
                                                .getAllGoodsCall
                                                .rootList(
                                                  formGetAllGoodsResponse
                                                      .jsonBody,
                                                )!
                                                .map((e) => e != null && e != ''
                                                    ? GoodDTOStruct.fromMap(e)
                                                    : null)
                                                .withoutNulls
                                                .toList(),
                                            getOrderParam: _model.getOrder!,
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => setState(() {}));
                                },
                                text: FFLocalizations.of(context).getText(
                                  'a9mt3ddz' /* Add good */,
                                ),
                                icon: const Icon(
                                  Icons.add,
                                  size: 20.0,
                                ),
                                options: FFButtonOptions(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      12.0, 12.0, 12.0, 12.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: 'Outfit',
                                        fontSize: 20.0,
                                      ),
                                  elevation: 3.0,
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                FFButtonWidget(
                                  onPressed: () async {
                                    context.safePop();
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'w80oozv0' /* Cancel */,
                                  ),
                                  options: FFButtonOptions(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        24.0, 24.0, 24.0, 24.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .headlineMedium,
                                    elevation: 3.0,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                FFButtonWidget(
                                  onPressed: () async {
                                    if (_model.formKey.currentState == null ||
                                        !_model.formKey.currentState!
                                            .validate()) {
                                      return;
                                    }
                                    if (_model.shopDropDownValue == null) {
                                      return;
                                    }
                                    _model.updateOrderStruct(
                                      (e) => e
                                        ..id = _model.getOrder?.id
                                        ..shopID = (HaulageCompanyAPIGroup
                                                            .getAllShopsCall
                                                            .rootList(
                                                              orderFormGetAllShopsResponse
                                                                  .jsonBody,
                                                            )
                                                            .where((e) =>
                                                                _model
                                                                    .shopDropDownValue! ==
                                                                ShopDTOStruct
                                                                        .fromMap(
                                                                            e)
                                                                    .name)
                                                            .toList()
                                                            .first !=
                                                        null &&
                                                    HaulageCompanyAPIGroup
                                                            .getAllShopsCall
                                                            .rootList(
                                                              orderFormGetAllShopsResponse
                                                                  .jsonBody,
                                                            )
                                                            .where((e) =>
                                                                _model
                                                                    .shopDropDownValue! ==
                                                                ShopDTOStruct
                                                                        .fromMap(
                                                                            e)
                                                                    .name)
                                                            .toList()
                                                            .first !=
                                                        ''
                                                ? ShopDTOStruct.fromMap(
                                                    HaulageCompanyAPIGroup
                                                        .getAllShopsCall
                                                        .rootList(
                                                          orderFormGetAllShopsResponse
                                                              .jsonBody,
                                                        )
                                                        .where((e) =>
                                                            _model
                                                                .shopDropDownValue! ==
                                                            ShopDTOStruct
                                                                    .fromMap(e)
                                                                .name)
                                                        .toList()
                                                        .first)
                                                : null)
                                            ?.id
                                        ..goodIDs = _model.getOrder!.goodDTOs
                                            .map((e) => e.id)
                                            .toList(),
                                    );
                                    if (widget.isExisting!) {
                                      _model.updateResult =
                                          await HaulageCompanyAPIGroup
                                              .updateOrderCall
                                              .call(
                                        id: _model.order?.id,
                                        orderJson: _model.order?.toMap(),
                                      );
                                      if ((_model.updateResult?.succeeded ??
                                          true)) {
                                        context.safePop();
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Failed to update order',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                            ),
                                            duration:
                                                const Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .error,
                                          ),
                                        );
                                      }
                                    } else {
                                      _model.createResult =
                                          await HaulageCompanyAPIGroup
                                              .createOrderCall
                                              .call(
                                        orderJson: _model.order?.toMap(),
                                      );
                                      if ((_model.createResult?.succeeded ??
                                          true)) {
                                        context.safePop();
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Failed to create order',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                            ),
                                            duration:
                                                const Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .error,
                                          ),
                                        );
                                      }
                                    }

                                    setState(() {});
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'r3zwqkn4' /* Confirm */,
                                  ),
                                  options: FFButtonOptions(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        24.0, 24.0, 24.0, 24.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .headlineMedium,
                                    elevation: 3.0,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ].divide(const SizedBox(width: 10.0)),
                            ),
                          ].divide(const SizedBox(height: 10.0)),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
