import 'package:haulage_company/util/string_capitalize.dart';

import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'good_form_widget.dart' show GoodFormWidget;
import 'package:flutter/material.dart';

class GoodFormModel extends FlutterFlowModel<GoodFormWidget> {
  ///  Local state fields for this page.

  GoodDTOStruct? good;
  void updateGoodStruct(Function(GoodDTOStruct) updateFn) =>
      updateFn(good ??= GoodDTOStruct());

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
        'widgets.common.textField.required',
      ).capitalize();
    }

    return null;
  }

  // State field(s) for DescriptionField widget.
  FocusNode? descriptionFieldFocusNode;
  TextEditingController? descriptionFieldController;
  String? Function(BuildContext, String?)? descriptionFieldControllerValidator;
  String? _descriptionFieldControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'widgets.common.textField.required',
      ).capitalize();
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
        'widgets.common.textField.required',
      ).capitalize();
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
        'widgets.common.textField.required',
      ).capitalize();
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (updateGood)] action in ConfirmButton widget.
  ApiCallResponse? updateResult;
  // Stores action output result for [Backend Call - API (createGood)] action in ConfirmButton widget.
  ApiCallResponse? createResult;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    nameFieldControllerValidator = _nameFieldControllerValidator;
    descriptionFieldControllerValidator = _descriptionFieldControllerValidator;
    sizeFieldControllerValidator = _sizeFieldControllerValidator;
    weightFieldControllerValidator = _weightFieldControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    nameFieldFocusNode?.dispose();
    nameFieldController?.dispose();

    descriptionFieldFocusNode?.dispose();
    descriptionFieldController?.dispose();

    sizeFieldFocusNode?.dispose();
    sizeFieldController?.dispose();

    weightFieldFocusNode?.dispose();
    weightFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
