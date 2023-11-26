import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'order_goods_list_item_model.dart';
export 'order_goods_list_item_model.dart';

class OrderGoodsListItemWidget extends StatefulWidget {
  const OrderGoodsListItemWidget({
    super.key,
    required this.stackedGoodParam,
  });

  final GetStackedGoodDTOStruct? stackedGoodParam;

  @override
  _OrderGoodsListItemWidgetState createState() =>
      _OrderGoodsListItemWidgetState();
}

class _OrderGoodsListItemWidgetState extends State<OrderGoodsListItemWidget> {
  late OrderGoodsListItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrderGoodsListItemModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.stackedGood = widget.stackedGoodParam;
      });
    });

    _model.quantityFieldController ??= TextEditingController(
        text: widget.stackedGoodParam?.quantity.toString());
    _model.quantityFieldFocusNode ??= FocusNode();
    _model.quantityFieldFocusNode!.addListener(
      () async {
        _model.updateStackedGoodStruct(
          (e) =>
              e..quantity = int.tryParse(_model.quantityFieldController.text),
        );
      },
    );
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _model.formKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            valueOrDefault<String>(
              widget.stackedGoodParam?.goodDTO.name,
              'Good',
            ),
            style: FlutterFlowTheme.of(context).bodyLarge,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextFormField(
                  controller: _model.quantityFieldController,
                  focusNode: _model.quantityFieldFocusNode,
                  autofocus: true,
                  textInputAction: TextInputAction.next,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: FFLocalizations.of(context).getText(
                      'wftuluyw' /* Quantity */,
                    ),
                    labelStyle: FlutterFlowTheme.of(context).labelLarge,
                    hintStyle: FlutterFlowTheme.of(context).labelMedium,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    filled: true,
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  style: FlutterFlowTheme.of(context).bodyLarge,
                  keyboardType: TextInputType.number,
                  validator: _model.quantityFieldControllerValidator
                      .asValidator(context),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                  ],
                ),
              ),
              FlutterFlowIconButton(
                borderColor: FlutterFlowTheme.of(context).primary,
                borderRadius: 8.0,
                borderWidth: 1.0,
                buttonSize: 40.0,
                fillColor: FlutterFlowTheme.of(context).accent1,
                icon: Icon(
                  Icons.delete,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                onPressed: () {
                  print('DeleteButton pressed ...');
                },
              ),
            ].divide(const SizedBox(width: 10.0)),
          ),
        ].divide(const SizedBox(height: 10.0)),
      ),
    );
  }
}
