import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'add_quantity_dialog_model.dart';
export 'add_quantity_dialog_model.dart';

class AddQuantityDialogWidget extends StatefulWidget {
  const AddQuantityDialogWidget({
    super.key,
    required this.goodParam,
  });

  final GoodDTOStruct? goodParam;

  @override
  _AddQuantityDialogWidgetState createState() =>
      _AddQuantityDialogWidgetState();
}

class _AddQuantityDialogWidgetState extends State<AddQuantityDialogWidget> {
  late AddQuantityDialogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddQuantityDialogModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.good = widget.goodParam;
    });

    _model.quantityFieldController ??= TextEditingController();
    _model.quantityFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
          _model.quantityFieldController?.text =
              FFLocalizations.of(context).getText(
            'pzmh44tk' /* 0 */,
          );
        }));
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
                'vh0vbnw4' /* Add quantity to good */,
              ),
              style: FlutterFlowTheme.of(context).titleLarge,
            ),
            TextFormField(
              controller: _model.quantityFieldController,
              focusNode: _model.quantityFieldFocusNode,
              autofocus: true,
              textInputAction: TextInputAction.next,
              obscureText: false,
              decoration: InputDecoration(
                labelText: FFLocalizations.of(context).getText(
                  'igis03u3' /* Quantity */,
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
              validator:
                  _model.quantityFieldControllerValidator.asValidator(context),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[0-9]'))
              ],
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
                    'ge0jne1u' /* Cancel */,
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
                    _model.updateGoodStruct(
                      (e) => e
                        ..quantity = _model.good!.quantity +
                            int.parse(_model.quantityFieldController.text),
                    );
                    _model.updateResult =
                        await HaulageCompanyAPIGroup.updateGoodCall.call(
                      bearerAuth: currentUserData?.accessToken,
                      id: _model.good?.id,
                      goodJsonJson: _model.good?.toMap(),
                    );
                    if ((_model.updateResult?.succeeded ?? true)) {
                      Navigator.pop(context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Failed to update quantity',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                          ),
                          duration: const Duration(milliseconds: 4000),
                          backgroundColor: FlutterFlowTheme.of(context).error,
                        ),
                      );
                    }

                    setState(() {});
                  },
                  text: FFLocalizations.of(context).getText(
                    '2vyzkjln' /* Confirm */,
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
