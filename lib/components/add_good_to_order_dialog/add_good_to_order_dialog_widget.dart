import 'package:haulage_company/util/show_error_snack_bar.dart';

import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'add_good_to_order_dialog_model.dart';
export 'add_good_to_order_dialog_model.dart';

class AddGoodToOrderDialogWidget extends StatefulWidget {
  const AddGoodToOrderDialogWidget({
    super.key,
    required this.getOrderParam,
    required this.goods,
  });

  final GetOrderDTOStruct? getOrderParam;
  final List<GoodDTOStruct>? goods;

  @override
  _AddGoodToOrderDialogWidgetState createState() =>
      _AddGoodToOrderDialogWidgetState();
}

class _AddGoodToOrderDialogWidgetState
    extends State<AddGoodToOrderDialogWidget> {
  late AddGoodToOrderDialogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddGoodToOrderDialogModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.getOrder = widget.getOrderParam;
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
      child: Form(
        key: _model.formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              FFLocalizations.of(context).getText(
                'kla312ft' /* Add good to order */,
              ),
              style: FlutterFlowTheme.of(context).titleLarge,
            ),
            FlutterFlowDropDown<int>(
              controller: _model.goodDropDownValueController ??=
                  FormFieldController<int>(
                _model.goodDropDownValue ??= null,
              ),
              options: List<int>.from(widget.goods!.map((e) => e.id).toList()),
              optionLabels: widget.goods!.map((e) => e.name).toList(),
              onChanged: (val) =>
                  setState(() => _model.goodDropDownValue = val),
              textStyle: FlutterFlowTheme.of(context).bodyLarge,
              hintText: FFLocalizations.of(context).getText(
                'z7lglw3a' /* Select good... */,
              ),
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 24.0,
              ),
              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
              elevation: 2.0,
              borderColor: FlutterFlowTheme.of(context).alternate,
              borderWidth: 2.0,
              borderRadius: 8.0,
              margin: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
              hidesUnderline: true,
              isSearchable: false,
              isMultiSelect: false,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FFButtonWidget(
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  text: FFLocalizations.of(context).getText(
                    '4kdyikj7' /* Cancel */,
                  ),
                  options: FFButtonOptions(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).headlineMedium,
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
                    if (_model.goodDropDownValue == null) {
                      showErrorSnackBar(context, 'No good selected');
                      return;
                    }
                    if (_model.getOrder?.goodDTOs
                            .where(
                                (e) => e.goodDTO.id == _model.goodDropDownValue)
                            .toList().isEmpty) {
                      _model.updatePage(() {
                        _model.updateGetOrderStruct(
                          (e) => e
                            ..updateGoodDTOs(
                              (e) => e.add(GetStackedGoodDTOStruct(
                                goodDTO: widget.goods
                                    ?.where(
                                        (e) => e.id == _model.goodDropDownValue)
                                    .toList()
                                    .first,
                              )),
                            ),
                        );
                      });
                      Navigator.pop(context);
                    } else {
                      showErrorSnackBar(context, 'Selected good already added to order');
                    }
                  },
                  text: FFLocalizations.of(context).getText(
                    'f1kd0bog' /* Confirm */,
                  ),
                  options: FFButtonOptions(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).headlineMedium,
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
    );
  }
}
