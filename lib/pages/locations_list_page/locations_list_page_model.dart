import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'locations_list_page_widget.dart' show LocationsListPageWidget;
import 'package:flutter/material.dart';

class LocationsListPageModel extends FlutterFlowModel<LocationsListPageWidget> {
  ///  Local state fields for this page.

  List<LorrySiteDTOStruct> locations = [];
  void addToLocations(LorrySiteDTOStruct item) => locations.add(item);
  void removeFromLocations(LorrySiteDTOStruct item) => locations.remove(item);
  void removeAtIndexFromLocations(int index) => locations.removeAt(index);
  void insertAtIndexInLocations(int index, LorrySiteDTOStruct item) =>
      locations.insert(index, item);
  void updateLocationsAtIndex(
          int index, Function(LorrySiteDTOStruct) updateFn) =>
      locations[index] = updateFn(locations[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (deleteLocation)] action in DeleteButton widget.
  ApiCallResponse? deleteResult;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  Future updateLocations(BuildContext context) async {
    ApiCallResponse? locationsJSON;

    locationsJSON = await HaulageCompanyAPIGroup.getAllLocationsCall.call();
    if ((locationsJSON.succeeded ?? true)) {
      locations =
          LorrySiteDTOListStruct.fromMap((locationsJSON.jsonBody ?? ''))
              .sites
              .toList()
              .cast<LorrySiteDTOStruct>();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Failed to update locations',
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
