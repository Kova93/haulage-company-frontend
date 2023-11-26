import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'transport_form_widget.dart' show TransportFormWidget;
import 'package:flutter/material.dart';

class TransportFormModel extends FlutterFlowModel<TransportFormWidget> {
  ///  Local state fields for this page.

  TransportOperationDTOStruct? transportOperation;
  void updateTransportOperationStruct(
          Function(TransportOperationDTOStruct) updateFn) =>
      updateFn(transportOperation ??= TransportOperationDTOStruct());

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  DateTime? datePicked;
  // State field(s) for OrderDropDown widget.
  int? orderDropDownValue;
  FormFieldController<int>? orderDropDownValueController;
  // Stores action output result for [Backend Call - API (updateTransportOperation)] action in ConfirmButton widget.
  ApiCallResponse? updateResult;
  // Stores action output result for [Backend Call - API (createTransportOperation)] action in ConfirmButton widget.
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
