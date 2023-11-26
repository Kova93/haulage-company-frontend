import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/add_good_to_order_dialog/add_good_to_order_dialog_widget.dart';
import '/components/order_goods_list_item/order_goods_list_item_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
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
          child: Form(
            key: _model.formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        '54o63x4o' /* Shop */,
                      ),
                      style: FlutterFlowTheme.of(context).labelLarge.override(
                            fontFamily: 'Readex Pro',
                            fontStyle: FontStyle.italic,
                          ),
                    ),
                    FutureBuilder<ApiCallResponse>(
                      future: HaulageCompanyAPIGroup.getAllShopsCall.call(
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
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        final shopDropDownGetAllShopsResponse = snapshot.data!;
                        return FlutterFlowDropDown<int>(
                          controller: _model.shopDropDownValueController ??=
                              FormFieldController<int>(
                            _model.shopDropDownValue ??=
                                _model.getOrder?.shopDTO.id,
                          ),
                          options: List<int>.from(HaulageCompanyAPIGroup
                              .getAllShopsCall
                              .rootList(
                                shopDropDownGetAllShopsResponse.jsonBody,
                              )!
                              .map((e) => (e != null && e != ''
                                      ? ShopDTOStruct.fromMap(e)
                                      : null)
                                  ?.id)
                              .withoutNulls
                              .toList()),
                          optionLabels:
                              (HaulageCompanyAPIGroup.getAllShopsCall.rootList(
                            shopDropDownGetAllShopsResponse.jsonBody,
                          ) as List)
                                  .map<String>((s) => s.toString())
                                  .toList().map((e) => (e != ''
                                          ? ShopDTOStruct.fromMap(e)
                                          : null)
                                      ?.name)
                                  .withoutNulls
                                  .toList(),
                          onChanged: (val) =>
                              setState(() => _model.shopDropDownValue = val),
                          textStyle: FlutterFlowTheme.of(context).bodyLarge,
                          hintText: FFLocalizations.of(context).getText(
                            'l4d5zy7g' /* Select shop... */,
                          ),
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 2.0,
                          borderColor: FlutterFlowTheme.of(context).alternate,
                          borderWidth: 2.0,
                          borderRadius: 8.0,
                          margin: const EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                          hidesUnderline: true,
                          isSearchable: false,
                          isMultiSelect: false,
                        );
                      },
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        'aimy0v0e' /* Goods */,
                      ),
                      style: FlutterFlowTheme.of(context).labelLarge.override(
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
                          separatorBuilder: (_, __) => const SizedBox(height: 10.0),
                          itemBuilder: (context, goodsListIndex) {
                            final goodsListItem = goodsList[goodsListIndex];
                            return Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                              child: wrapWithModel(
                                model: _model.orderGoodsListItemModels.getModel(
                                  goodsListItem.goodDTO.id.toString(),
                                  goodsListIndex,
                                ),
                                updateCallback: () => setState(() {}),
                                child: OrderGoodsListItemWidget(
                                  key: Key(
                                    'Keyjvc_${goodsListItem.goodDTO.id.toString()}',
                                  ),
                                  stackedGoodParam: goodsListItem,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                    Builder(
                      builder: (context) => FutureBuilder<ApiCallResponse>(
                        future: HaulageCompanyAPIGroup.getAllGoodsCall.call(
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
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          final addGoodButtonGetAllGoodsResponse =
                              snapshot.data!;
                          return FFButtonWidget(
                            onPressed: () async {
                              await showAlignedDialog(
                                barrierColor:
                                    FlutterFlowTheme.of(context).accent4,
                                context: context,
                                isGlobal: true,
                                avoidOverflow: false,
                                targetAnchor: const AlignmentDirectional(0.0, 0.0)
                                    .resolve(Directionality.of(context)),
                                followerAnchor: const AlignmentDirectional(0.0, 0.0)
                                    .resolve(Directionality.of(context)),
                                builder: (dialogContext) {
                                  return Material(
                                    color: Colors.transparent,
                                    child: GestureDetector(
                                      onTap: () => _model
                                              .unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                      child: AddGoodToOrderDialogWidget(
                                        getOrderParam: _model.getOrder!,
                                        goods: HaulageCompanyAPIGroup
                                            .getAllGoodsCall
                                            .rootList(
                                              addGoodButtonGetAllGoodsResponse
                                                  .jsonBody,
                                            )!
                                            .map((e) => e != null && e != ''
                                                ? GoodDTOStruct.fromMap(e)
                                                : null)
                                            .withoutNulls
                                            .toList(),
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => setState(() {}));
                            },
                            text: FFLocalizations.of(context).getText(
                              '5bfmx2a6' /* Add good */,
                            ),
                            icon: Icon(
                              Icons.add,
                              color: FlutterFlowTheme.of(context).info,
                              size: 20.0,
                            ),
                            options: FFButtonOptions(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 12.0, 12.0, 12.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle:
                                  FlutterFlowTheme.of(context).headlineSmall,
                              elevation: 3.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          );
                        },
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
                            textStyle:
                                FlutterFlowTheme.of(context).headlineMedium,
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
                                !_model.formKey.currentState!.validate()) {
                              return;
                            }
                            if (_model.shopDropDownValue == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'No shop selected',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                  ),
                                  duration: const Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).error,
                                ),
                              );
                              return;
                            }
                            _model.updateOrderStruct(
                              (e) => e
                                ..id = _model.getOrder?.id
                                ..shopID = _model.shopDropDownValue
                                ..stackedGoodDTOs = functions
                                    .mapToStackedGoodDTO(
                                        _model.getOrder!.goodDTOs.toList())
                                    .toList(),
                            );
                            if (widget.isExisting!) {
                              _model.updateResult = await HaulageCompanyAPIGroup
                                  .updateOrderCall
                                  .call(
                                bearerAuth: currentAuthenticationToken,
                                id: _model.order?.id,
                                orderJsonJson: _model.order?.toMap(),
                              );
                              if ((_model.updateResult?.succeeded ?? true)) {
                                context.safePop();
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Failed to update order',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                    ),
                                    duration: const Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).error,
                                  ),
                                );
                              }
                            } else {
                              _model.createResult = await HaulageCompanyAPIGroup
                                  .createOrderCall
                                  .call(
                                bearerAuth: currentAuthenticationToken,
                                orderJsonJson: _model.order?.toMap(),
                              );
                              if ((_model.createResult?.succeeded ?? true)) {
                                context.safePop();
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Failed to create order',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                    ),
                                    duration: const Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).error,
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
                            textStyle:
                                FlutterFlowTheme.of(context).headlineMedium,
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
          ),
        ),
      ),
    );
  }
}
