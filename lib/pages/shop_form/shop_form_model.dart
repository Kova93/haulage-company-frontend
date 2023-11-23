import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'shop_form_widget.dart' show ShopFormWidget;
import 'package:flutter/material.dart';

class ShopFormModel extends FlutterFlowModel<ShopFormWidget> {
  ///  Local state fields for this page.

  ShopDTOStruct? shop;
  void updateShopStruct(Function(ShopDTOStruct) updateFn) =>
      updateFn(shop ??= ShopDTOStruct());

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'kjz33d80' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  String? _textController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'lia2uahk' /* Field is required */,
      );
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (updateShop)] action in ConfirmButton widget.
  ApiCallResponse? updateResult;
  // Stores action output result for [Backend Call - API (createShop)] action in ConfirmButton widget.
  ApiCallResponse? createResult;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    textController1Validator = _textController1Validator;
    textController2Validator = _textController2Validator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
