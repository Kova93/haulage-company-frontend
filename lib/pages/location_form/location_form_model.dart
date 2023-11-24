import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'location_form_widget.dart' show LocationFormWidget;
import 'package:flutter/material.dart';

class LocationFormModel extends FlutterFlowModel<LocationFormWidget> {
  ///  Local state fields for this page.

  LorrySiteDTOStruct? location;
  void updateLocationStruct(Function(LorrySiteDTOStruct) updateFn) =>
      updateFn(location ??= LorrySiteDTOStruct());

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for NameField widget.
  FocusNode? nameFieldFocusNode;
  TextEditingController? nameFieldController;
  String? Function(BuildContext, String?)? nameFieldControllerValidator;
  String? _nameFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'dmikg5n0' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for AddressField widget.
  FocusNode? addressFieldFocusNode;
  TextEditingController? addressFieldController;
  String? Function(BuildContext, String?)? addressFieldControllerValidator;
  String? _addressFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'h1p54kcu' /* Field is required */,
      );
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (updateLocation)] action in ConfirmButton widget.
  ApiCallResponse? updateResult;
  // Stores action output result for [Backend Call - API (createLocation)] action in ConfirmButton widget.
  ApiCallResponse? createResult;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    nameFieldControllerValidator = _nameFieldControllerValidator;
    addressFieldControllerValidator = _addressFieldControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    nameFieldFocusNode?.dispose();
    nameFieldController?.dispose();

    addressFieldFocusNode?.dispose();
    addressFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
