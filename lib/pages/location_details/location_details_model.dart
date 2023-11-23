import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'location_details_widget.dart' show LocationDetailsWidget;
import 'package:flutter/material.dart';

class LocationDetailsModel extends FlutterFlowModel<LocationDetailsWidget> {
  ///  Local state fields for this page.

  LorrySiteDTOStruct? location;
  void updateLocationStruct(Function(LorrySiteDTOStruct) updateFn) =>
      updateFn(location ??= LorrySiteDTOStruct());

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Stores action output result for [Backend Call - API (deleteVehicle)] action in DeleteButton widget.
  ApiCallResponse? deleteVehicleResult;
  // Stores action output result for [Backend Call - API (deleteGood)] action in DeleteButton widget.
  ApiCallResponse? deleteGoodResult;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
  }

  /// Action blocks are added here.

  Future updateLocation(BuildContext context) async {
    ApiCallResponse? updateResult;

    updateResult = await HaulageCompanyAPIGroup.getLocationByIdCall.call(
      id: location?.id,
    );
    if ((updateResult.succeeded ?? true)) {
      location = (updateResult.jsonBody ?? '') != null &&
              (updateResult.jsonBody ?? '') != ''
          ? LorrySiteDTOStruct.fromMap((updateResult.jsonBody ?? ''))
          : null;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Failed to load location',
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
