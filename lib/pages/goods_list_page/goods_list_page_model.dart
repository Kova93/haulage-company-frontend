import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'goods_list_page_widget.dart' show GoodsListPageWidget;
import 'package:flutter/material.dart';

class GoodsListPageModel extends FlutterFlowModel<GoodsListPageWidget> {
  ///  Local state fields for this page.

  List<GoodDTOStruct> goods = [];
  void addToGoods(GoodDTOStruct item) => goods.add(item);
  void removeFromGoods(GoodDTOStruct item) => goods.remove(item);
  void removeAtIndexFromGoods(int index) => goods.removeAt(index);
  void insertAtIndexInGoods(int index, GoodDTOStruct item) =>
      goods.insert(index, item);
  void updateGoodsAtIndex(int index, Function(GoodDTOStruct) updateFn) =>
      goods[index] = updateFn(goods[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (deleteGood)] action in DeleteButton widget.
  ApiCallResponse? deleteResult;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  Future updateGoods(BuildContext context) async {
    ApiCallResponse? updateResult;

    updateResult = await HaulageCompanyAPIGroup.getAllGoodsCall.call();
    if ((updateResult.succeeded ?? true)) {
      goods = HaulageCompanyAPIGroup.getAllGoodsCall
          .rootList(
            (updateResult.jsonBody ?? ''),
          )!
          .map((e) => e != null && e != '' ? GoodDTOStruct.fromMap(e) : null)
          .withoutNulls
          .toList()
          .toList()
          .cast<GoodDTOStruct>();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Failed to load goods',
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
