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
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'w4btgtad' /* Field is required */,
      );
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (updateGood)] action in Button widget.
  ApiCallResponse? updateResult;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
