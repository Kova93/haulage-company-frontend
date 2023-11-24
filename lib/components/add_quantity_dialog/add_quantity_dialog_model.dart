import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_quantity_dialog_widget.dart' show AddQuantityDialogWidget;
import 'package:flutter/material.dart';

class AddQuantityDialogModel extends FlutterFlowModel<AddQuantityDialogWidget> {
  ///  Local state fields for this component.

  GoodDTOStruct? good;
  void updateGoodStruct(Function(GoodDTOStruct) updateFn) =>
      updateFn(good ??= GoodDTOStruct());

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for QuantityField widget.
  FocusNode? quantityFieldFocusNode;
  TextEditingController? quantityFieldController;
  String? Function(BuildContext, String?)? quantityFieldControllerValidator;
  String? _quantityFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'w4btgtad' /* Field is required */,
      );
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (updateGood)] action in ConfirmButton widget.
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
