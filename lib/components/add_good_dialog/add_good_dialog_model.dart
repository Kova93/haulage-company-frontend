import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_good_dialog_widget.dart' show AddGoodDialogWidget;
import 'package:flutter/material.dart';

class AddGoodDialogModel extends FlutterFlowModel<AddGoodDialogWidget> {
  ///  Local state fields for this component.

  GetOrderDTOStruct? getOrder;
  void updateGetOrderStruct(Function(GetOrderDTOStruct) updateFn) =>
      updateFn(getOrder ??= GetOrderDTOStruct());

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for GoodDropDown widget.
  String? goodDropDownValue;
  FormFieldController<String>? goodDropDownValueController;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
