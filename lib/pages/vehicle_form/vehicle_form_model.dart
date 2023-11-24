import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'vehicle_form_widget.dart' show VehicleFormWidget;
import 'package:flutter/material.dart';

class VehicleFormModel extends FlutterFlowModel<VehicleFormWidget> {
  ///  Local state fields for this page.

  VehicleDTOStruct? vehicle;
  void updateVehicleStruct(Function(VehicleDTOStruct) updateFn) =>
      updateFn(vehicle ??= VehicleDTOStruct());

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for LicensePlateField widget.
  FocusNode? licensePlateFieldFocusNode;
  TextEditingController? licensePlateFieldController;
  String? Function(BuildContext, String?)? licensePlateFieldControllerValidator;
  String? _licensePlateFieldControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'zs5szbt9' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for SizeField widget.
  FocusNode? sizeFieldFocusNode;
  TextEditingController? sizeFieldController;
  String? Function(BuildContext, String?)? sizeFieldControllerValidator;
  String? _sizeFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'glssoky6' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for WeightField widget.
  FocusNode? weightFieldFocusNode;
  TextEditingController? weightFieldController;
  String? Function(BuildContext, String?)? weightFieldControllerValidator;
  String? _weightFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'puxlvlgy' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for LocationDropDown widget.
  String? locationDropDownValue;
  FormFieldController<String>? locationDropDownValueController;
  // Stores action output result for [Backend Call - API (updateVehicle)] action in ConfirmButton widget.
  ApiCallResponse? updateResult;
  // Stores action output result for [Backend Call - API (createVehicle)] action in ConfirmButton widget.
  ApiCallResponse? createResult;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    licensePlateFieldControllerValidator =
        _licensePlateFieldControllerValidator;
    sizeFieldControllerValidator = _sizeFieldControllerValidator;
    weightFieldControllerValidator = _weightFieldControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    licensePlateFieldFocusNode?.dispose();
    licensePlateFieldController?.dispose();

    sizeFieldFocusNode?.dispose();
    sizeFieldController?.dispose();

    weightFieldFocusNode?.dispose();
    weightFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
