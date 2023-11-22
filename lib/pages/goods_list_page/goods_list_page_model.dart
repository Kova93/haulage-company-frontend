import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'goods_list_page_widget.dart' show GoodsListPageWidget;
import 'package:flutter/material.dart';

class GoodsListPageModel extends FlutterFlowModel<GoodsListPageWidget> {
  ///  Local state fields for this page.

  List<GoodStruct> goods = [];
  void addToGoods(GoodStruct item) => goods.add(item);
  void removeFromGoods(GoodStruct item) => goods.remove(item);
  void removeAtIndexFromGoods(int index) => goods.removeAt(index);
  void insertAtIndexInGoods(int index, GoodStruct item) =>
      goods.insert(index, item);
  void updateGoodsAtIndex(int index, Function(GoodStruct) updateFn) =>
      goods[index] = updateFn(goods[index]);

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

  Future updateGoods(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    if (true) {
      goods = FFAppState().dummyGoods.toList().cast<GoodStruct>();
    }
  }

  /// Additional helper methods are added here.
}
