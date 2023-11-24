import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'order_form_widget.dart' show OrderFormWidget;
import 'package:flutter/material.dart';

class OrderFormModel extends FlutterFlowModel<OrderFormWidget> {
  ///  Local state fields for this page.

  GetOrderDTOStruct? getOrder;
  void updateGetOrderStruct(Function(GetOrderDTOStruct) updateFn) =>
      updateFn(getOrder ??= GetOrderDTOStruct());

  OrderDTOStruct? order;
  void updateOrderStruct(Function(OrderDTOStruct) updateFn) =>
      updateFn(order ??= OrderDTOStruct());

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for ShopDropDown widget.
  String? shopDropDownValue;
  FormFieldController<String>? shopDropDownValueController;
  // Stores action output result for [Backend Call - API (updateOrder)] action in ConfirmButton widget.
  ApiCallResponse? updateResult;
  // Stores action output result for [Backend Call - API (createOrder)] action in ConfirmButton widget.
  ApiCallResponse? createResult;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
