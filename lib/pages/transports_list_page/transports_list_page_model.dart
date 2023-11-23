import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'transports_list_page_widget.dart' show TransportsListPageWidget;
import 'package:flutter/material.dart';

class TransportsListPageModel
    extends FlutterFlowModel<TransportsListPageWidget> {
  ///  Local state fields for this page.

  List<TransportOperationDTOStruct> transports = [];
  void addToTransports(TransportOperationDTOStruct item) =>
      transports.add(item);
  void removeFromTransports(TransportOperationDTOStruct item) =>
      transports.remove(item);
  void removeAtIndexFromTransports(int index) => transports.removeAt(index);
  void insertAtIndexInTransports(int index, TransportOperationDTOStruct item) =>
      transports.insert(index, item);
  void updateTransportsAtIndex(
          int index, Function(TransportOperationDTOStruct) updateFn) =>
      transports[index] = updateFn(transports[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (deleteTransportOperation)] action in DeleteButton widget.
  ApiCallResponse? deleteResult;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  Future updateTransports(BuildContext context) async {
    ApiCallResponse? updateResult;

    updateResult =
        await HaulageCompanyAPIGroup.getAllTransportOperationsCall.call();
    if ((updateResult.succeeded ?? true)) {
      transports = HaulageCompanyAPIGroup.getAllTransportOperationsCall
          .rootList(
            (updateResult.jsonBody ?? ''),
          )!
          .map((e) => e != null && e != ''
              ? TransportOperationDTOStruct.fromMap(e)
              : null)
          .withoutNulls
          .toList()
          .toList()
          .cast<TransportOperationDTOStruct>();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Failed to load transports',
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
