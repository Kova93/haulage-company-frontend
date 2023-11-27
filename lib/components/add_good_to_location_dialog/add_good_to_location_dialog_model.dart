import 'package:haulage_company/util/string_capitalize.dart';

import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_good_to_location_dialog_widget.dart'
    show AddGoodToLocationDialogWidget;
import 'package:flutter/material.dart';

class AddGoodToLocationDialogModel
    extends FlutterFlowModel<AddGoodToLocationDialogWidget> {
  ///  Local state fields for this component.

  StackedGoodDTOStruct? stackedGood;
  void updateStackedGoodStruct(Function(StackedGoodDTOStruct) updateFn) =>
      updateFn(stackedGood ??= StackedGoodDTOStruct());

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for DropDown widget.
  int? dropDownValue;
  FormFieldController<int>? dropDownValueController;
  // State field(s) for QuantityField widget.
  FocusNode? quantityFieldFocusNode;
  TextEditingController? quantityFieldController;
  String? Function(BuildContext, String?)? quantityFieldControllerValidator;
  String? _quantityFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'widgets.common.textField.required',
      ).capitalize();
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (addGoodToLocation)] action in ConfirmButton widget.
  ApiCallResponse? updateResult;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    quantityFieldControllerValidator = _quantityFieldControllerValidator;
  }

  @override
  void dispose() {
    quantityFieldFocusNode?.dispose();
    quantityFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
