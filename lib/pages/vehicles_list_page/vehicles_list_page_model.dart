import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'vehicles_list_page_widget.dart' show VehiclesListPageWidget;
import 'package:flutter/material.dart';

class VehiclesListPageModel extends FlutterFlowModel<VehiclesListPageWidget> {
  ///  Local state fields for this page.

  List<VehicleStruct> vehicles = [];
  void addToVehicles(VehicleStruct item) => vehicles.add(item);
  void removeFromVehicles(VehicleStruct item) => vehicles.remove(item);
  void removeAtIndexFromVehicles(int index) => vehicles.removeAt(index);
  void insertAtIndexInVehicles(int index, VehicleStruct item) =>
      vehicles.insert(index, item);
  void updateVehiclesAtIndex(int index, Function(VehicleStruct) updateFn) =>
      vehicles[index] = updateFn(vehicles[index]);

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

  Future updateVehicles(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 100));
    if (true) {
      vehicles = FFAppState().dummyVehicles.toList().cast<VehicleStruct>();
    }
  }

  /// Additional helper methods are added here.
}
