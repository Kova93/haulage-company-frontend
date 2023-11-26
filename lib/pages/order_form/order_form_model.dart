import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/order_goods_list_item/order_goods_list_item_widget.dart';
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
  int? shopDropDownValue;
  FormFieldController<int>? shopDropDownValueController;
  // Models for OrderGoodsListItem dynamic component.
  late FlutterFlowDynamicModels<OrderGoodsListItemModel>
      orderGoodsListItemModels;
  // Stores action output result for [Backend Call - API (updateOrder)] action in ConfirmButton widget.
  ApiCallResponse? updateResult;
  // Stores action output result for [Backend Call - API (createOrder)] action in ConfirmButton widget.
  ApiCallResponse? createResult;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    orderGoodsListItemModels =
        FlutterFlowDynamicModels(() => OrderGoodsListItemModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    orderGoodsListItemModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
