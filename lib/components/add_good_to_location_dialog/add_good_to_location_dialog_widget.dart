import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'add_good_to_location_dialog_model.dart';
export 'add_good_to_location_dialog_model.dart';

class AddGoodToLocationDialogWidget extends StatefulWidget {
  const AddGoodToLocationDialogWidget({
    super.key,
    required this.locationId,
    required this.goods,
  });

  final int? locationId;
  final List<GoodDTOStruct>? goods;

  @override
  _AddGoodToLocationDialogWidgetState createState() =>
      _AddGoodToLocationDialogWidgetState();
}

class _AddGoodToLocationDialogWidgetState
    extends State<AddGoodToLocationDialogWidget> {
  late AddGoodToLocationDialogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddGoodToLocationDialogModel());

    _model.quantityFieldController ??= TextEditingController();
    _model.quantityFieldFocusNode ??= FocusNode();
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
                'vh0vbnw4' /* Add good to location */,
              ),
              style: FlutterFlowTheme.of(context).titleLarge,
            ),
            FlutterFlowDropDown<int>(
              controller: _model.dropDownValueController ??=
                  FormFieldController<int>(
                _model.dropDownValue ??= null,
              ),
              options: List<int>.from(widget.goods!.map((e) => e.id).toList()),
              optionLabels: widget.goods!.map((e) => e.name).toList(),
              onChanged: (val) => setState(() => _model.dropDownValue = val),
              textStyle: FlutterFlowTheme.of(context).bodyLarge,
              hintText: FFLocalizations.of(context).getText(
                'tqfbqbrz' /* Select good... */,
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
                    if (_model.dropDownValue == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'No good selected',
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
                      return;
                    }
                    _model.updateStackedGoodStruct(
                      (e) => e
                        ..goodId = widget.goods
                            ?.where((e) => e.id == _model.dropDownValue)
                            .toList()
                            .first
                            .id
                        ..quantity =
                            int.tryParse(_model.quantityFieldController.text),
                    );
                    _model.updateResult =
                        await HaulageCompanyAPIGroup.addGoodToLocationCall.call(
                      bearerAuth: currentAuthenticationToken,
                      id: widget.locationId,
                      stackedGoodJsonJson: _model.stackedGood?.toMap(),
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
