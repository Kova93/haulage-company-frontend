import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'vehicles_list_page_widget.dart' show VehiclesListPageWidget;
import 'package:flutter/material.dart';

class VehiclesListPageModel extends FlutterFlowModel<VehiclesListPageWidget> {
  ///  Local state fields for this page.

  List<VehicleDTOStruct> vehicles = [];
  void addToVehicles(VehicleDTOStruct item) => vehicles.add(item);
  void removeFromVehicles(VehicleDTOStruct item) => vehicles.remove(item);
  void removeAtIndexFromVehicles(int index) => vehicles.removeAt(index);
  void insertAtIndexInVehicles(int index, VehicleDTOStruct item) =>
      vehicles.insert(index, item);
  void updateVehiclesAtIndex(int index, Function(VehicleDTOStruct) updateFn) =>
      vehicles[index] = updateFn(vehicles[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (deleteVehicle)] action in DeleteButton widget.
  ApiCallResponse? deleteResult;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  Future updateVehicles(BuildContext context) async {
    ApiCallResponse? updateResult;

    updateResult = await HaulageCompanyAPIGroup.getAllVehiclesCall.call();
    if ((updateResult.succeeded ?? true)) {
      vehicles = HaulageCompanyAPIGroup.getAllVehiclesCall
          .rootList(
            (updateResult.jsonBody ?? ''),
          )!
          .map((e) => e != null && e != '' ? VehicleDTOStruct.fromMap(e) : null)
          .withoutNulls
          .toList()
          .toList()
          .cast<VehicleDTOStruct>();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Failed to load vehicles',
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
