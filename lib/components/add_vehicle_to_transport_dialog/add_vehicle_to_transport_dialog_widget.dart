import 'package:format/format.dart';
import 'package:haulage_company/util/show_error_snack_bar.dart';
import 'package:haulage_company/util/string_capitalize.dart';

import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'add_vehicle_to_transport_dialog_model.dart';
export 'add_vehicle_to_transport_dialog_model.dart';

class AddVehicleToTransportDialogWidget extends StatefulWidget {
  const AddVehicleToTransportDialogWidget({
    super.key,
    required this.transportParam,
    required this.vehicles,
  });

  final TransportOperationDTOStruct? transportParam;
  final List<VehicleDTOStruct>? vehicles;

  @override
  _AddVehicleToTransportDialogWidgetState createState() =>
      _AddVehicleToTransportDialogWidgetState();
}

class _AddVehicleToTransportDialogWidgetState
    extends State<AddVehicleToTransportDialogWidget> {
  late AddVehicleToTransportDialogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddVehicleToTransportDialogModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.transport = widget.transportParam;
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
                'dialogs.addVehicleToTransport.title',
              ).capitalize(),
              style: FlutterFlowTheme.of(context).titleLarge,
            ),
            FlutterFlowDropDown<int>(
              controller: _model.vehicleDropDownValueController ??=
                  FormFieldController<int>(
                _model.vehicleDropDownValue ??= null,
              ),
              options:
                  List<int>.from(widget.vehicles!.map((e) => e.id).toList()),
              optionLabels:
                  widget.vehicles!.map((e) => e.licensePlate).toList(),
              onChanged: (val) =>
                  setState(() => _model.vehicleDropDownValue = val),
              textStyle: FlutterFlowTheme.of(context).bodyLarge,
              hintText: FFLocalizations.of(context).getText(
                'widgets.common.dropdown.hint',
              ).format(
                FFLocalizations.of(context).getText(
                  'entities.vehicle'
                )
              ).capitalize(),
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
                    'widgets.common.cancel',
                  ).capitalize(),
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
                    if (_model.vehicleDropDownValue == null) {
                      showErrorSnackBar(context, FFLocalizations.of(context).getText(
                        'errors.validation.dropdown.empty'
                      ).format(
                        FFLocalizations.of(context).getText(
                          'entities.vehicle'
                        )
                      ).capitalize());
                      return;
                    }
                    if (_model.transport?.usedVehicleDTOs
                            .where((e) => e.id == _model.vehicleDropDownValue)
                            .isEmpty ?? true) {
                      _model.updatePage(() {
                        _model.updateTransportStruct(
                          (e) => e
                            ..updateUsedVehicleDTOs(
                              (e) => e.add(widget.vehicles!
                                  .where((e) =>
                                      e.id == _model.vehicleDropDownValue)
                                  .toList()
                                  .first),
                            ),
                        );
                      });
                      Navigator.pop(context);
                    } else {
                      showErrorSnackBar(context, FFLocalizations.of(context).getText(
                        'dialogs.addVehicleToTransport.errors.vehicleAlreadyAdded'
                      ).capitalize());
                    }
                  },
                  text: FFLocalizations.of(context).getText(
                    'widgets.common.confirm',
                  ).capitalize(),
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
