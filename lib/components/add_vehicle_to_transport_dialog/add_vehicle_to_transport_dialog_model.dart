import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_vehicle_to_transport_dialog_widget.dart'
    show AddVehicleToTransportDialogWidget;
import 'package:flutter/material.dart';

class AddVehicleToTransportDialogModel
    extends FlutterFlowModel<AddVehicleToTransportDialogWidget> {
  ///  Local state fields for this component.

  TransportOperationDTOStruct? transport;
  void updateTransportStruct(Function(TransportOperationDTOStruct) updateFn) =>
      updateFn(transport ??= TransportOperationDTOStruct());

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for VehicleDropDown widget.
  int? vehicleDropDownValue;
  FormFieldController<int>? vehicleDropDownValueController;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
