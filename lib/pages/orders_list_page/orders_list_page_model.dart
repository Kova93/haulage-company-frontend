import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'orders_list_page_widget.dart' show OrdersListPageWidget;
import 'package:flutter/material.dart';

class OrdersListPageModel extends FlutterFlowModel<OrdersListPageWidget> {
  ///  Local state fields for this page.

  List<OrderDTOStruct> orders = [];
  void addToOrders(OrderDTOStruct item) => orders.add(item);
  void removeFromOrders(OrderDTOStruct item) => orders.remove(item);
  void removeAtIndexFromOrders(int index) => orders.removeAt(index);
  void insertAtIndexInOrders(int index, OrderDTOStruct item) =>
      orders.insert(index, item);
  void updateOrdersAtIndex(int index, Function(OrderDTOStruct) updateFn) =>
      orders[index] = updateFn(orders[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (deleteOrder)] action in DeleteButton widget.
  ApiCallResponse? deleteResult;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  Future updateOrders(BuildContext context) async {
    ApiCallResponse? updateResult;

    updateResult = await HaulageCompanyAPIGroup.getAllOrdersCall.call();
    if ((updateResult.succeeded ?? true)) {
      orders = HaulageCompanyAPIGroup.getAllOrdersCall
          .rootList(
            (updateResult.jsonBody ?? ''),
          )!
          .map((e) => e != null && e != '' ? OrderDTOStruct.fromMap(e) : null)
          .withoutNulls
          .toList()
          .toList()
          .cast<OrderDTOStruct>();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Failed to load orders',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Readex Pro',
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
          ),
          duration: const Duration(milliseconds: 4000),
          backgroundColor: FlutterFlowTheme.of(context).error,
        ),
      );
    }
  }

  /// Additional helper methods are added here.
}
