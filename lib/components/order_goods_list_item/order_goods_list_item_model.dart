import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'order_goods_list_item_widget.dart' show OrderGoodsListItemWidget;
import 'package:flutter/material.dart';

class OrderGoodsListItemModel
    extends FlutterFlowModel<OrderGoodsListItemWidget> {
  ///  Local state fields for this component.

  GetStackedGoodDTOStruct? stackedGood;
  void updateStackedGoodStruct(Function(GetStackedGoodDTOStruct) updateFn) =>
      updateFn(stackedGood ??= GetStackedGoodDTOStruct());

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for QuantityField widget.
  FocusNode? quantityFieldFocusNode;
  TextEditingController? quantityFieldController;
  String? Function(BuildContext, String?)? quantityFieldControllerValidator;
  String? _quantityFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'dpl3y2ps' /* Field is required */,
      );
    }

    return null;
  }

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    quantityFieldControllerValidator = _quantityFieldControllerValidator;
  }

  @override
  void dispose() {
    quantityFieldFocusNode?.dispose();
    quantityFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
