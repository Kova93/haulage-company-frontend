import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'shops_list_page_widget.dart' show ShopsListPageWidget;
import 'package:flutter/material.dart';

class ShopsListPageModel extends FlutterFlowModel<ShopsListPageWidget> {
  ///  Local state fields for this page.

  List<ShopDTOStruct> shops = [];
  void addToShops(ShopDTOStruct item) => shops.add(item);
  void removeFromShops(ShopDTOStruct item) => shops.remove(item);
  void removeAtIndexFromShops(int index) => shops.removeAt(index);
  void insertAtIndexInShops(int index, ShopDTOStruct item) =>
      shops.insert(index, item);
  void updateShopsAtIndex(int index, Function(ShopDTOStruct) updateFn) =>
      shops[index] = updateFn(shops[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (deleteShop)] action in DeleteButton widget.
  ApiCallResponse? deleteResult;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  Future updateShops(BuildContext context) async {
    ApiCallResponse? updateResult;

    updateResult = await HaulageCompanyAPIGroup.getAllShopsCall.call();
    if ((updateResult.succeeded ?? true)) {
      shops = HaulageCompanyAPIGroup.getAllShopsCall
          .rootList(
            (updateResult.jsonBody ?? ''),
          )!
          .map((e) => e != null && e != '' ? ShopDTOStruct.fromMap(e) : null)
          .withoutNulls
          .toList()
          .toList()
          .cast<ShopDTOStruct>();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Failed to load shops',
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
