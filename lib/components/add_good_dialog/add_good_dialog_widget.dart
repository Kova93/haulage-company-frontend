import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'add_good_dialog_model.dart';
export 'add_good_dialog_model.dart';

class AddGoodDialogWidget extends StatefulWidget {
  const AddGoodDialogWidget({
    super.key,
    required this.goods,
    required this.getOrderParam,
  });

  final List<GoodDTOStruct>? goods;
  final GetOrderDTOStruct? getOrderParam;

  @override
  _AddGoodDialogWidgetState createState() => _AddGoodDialogWidgetState();
}

class _AddGoodDialogWidgetState extends State<AddGoodDialogWidget> {
  late AddGoodDialogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddGoodDialogModel());

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
    context.watch<FFAppState>();

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
                'vf7s01zd' /* Add good to order */,
              ),
              style: FlutterFlowTheme.of(context).titleLarge,
            ),
            FlutterFlowDropDown<String>(
              controller: _model.goodDropDownValueController ??=
                  FormFieldController<String>(null),
              options: widget.goods!.map((e) => e.name).toList(),
              onChanged: (val) =>
                  setState(() => _model.goodDropDownValue = val),
              textStyle: FlutterFlowTheme.of(context).bodyLarge,
              hintText: FFLocalizations.of(context).getText(
                'llmtuz95' /* Select good... */,
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
                    'nk90wt9i' /* Cancel */,
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
                    _model.updatePage(() {
                      _model.updateGetOrderStruct(
                        (e) => e
                          ..updateGoodDTOs(
                            (e) => e.add(widget.goods!
                                .where(
                                    (e) => e.name == _model.goodDropDownValue)
                                .toList()
                                .first),
                          ),
                      );
                    });
                    Navigator.pop(context);
                  },
                  text: FFLocalizations.of(context).getText(
                    'pvna2gyn' /* Confirm */,
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
