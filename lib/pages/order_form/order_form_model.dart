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
  int? shopDropDownValue;
  FormFieldController<int>? shopDropDownValueController;
  // State field(s) for QuantityField widget.
  FocusNode? quantityFieldFocusNode;
  TextEditingController? quantityFieldController;
  String? Function(BuildContext, String?)? quantityFieldControllerValidator;
  String? _quantityFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'q5h320ej' /* Field is required */,
      );
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (updateOrder)] action in ConfirmButton widget.
  ApiCallResponse? updateResult;
  // Stores action output result for [Backend Call - API (createOrder)] action in ConfirmButton widget.
  ApiCallResponse? createResult;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    quantityFieldControllerValidator = _quantityFieldControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    quantityFieldFocusNode?.dispose();
    quantityFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
