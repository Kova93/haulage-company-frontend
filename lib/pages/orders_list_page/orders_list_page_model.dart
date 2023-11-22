import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'orders_list_page_widget.dart' show OrdersListPageWidget;
import 'package:flutter/material.dart';

class OrdersListPageModel extends FlutterFlowModel<OrdersListPageWidget> {
  ///  Local state fields for this page.

  List<ShopStruct> shops = [];
  void addToShops(ShopStruct item) => shops.add(item);
  void removeFromShops(ShopStruct item) => shops.remove(item);
  void removeAtIndexFromShops(int index) => shops.removeAt(index);
  void insertAtIndexInShops(int index, ShopStruct item) =>
      shops.insert(index, item);
  void updateShopsAtIndex(int index, Function(ShopStruct) updateFn) =>
      shops[index] = updateFn(shops[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  Future updateShops(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 100));
    if (true) {
      shops = FFAppState().dummyShops.toList().cast<ShopStruct>();
    }
  }

  /// Additional helper methods are added here.
}
