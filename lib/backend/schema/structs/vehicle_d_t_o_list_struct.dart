// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VehicleDTOListStruct extends BaseStruct {
  VehicleDTOListStruct({
    List<VehicleDTOStruct>? vehicles,
  }) : _vehicles = vehicles;

  // "vehicles" field.
  List<VehicleDTOStruct>? _vehicles;
  List<VehicleDTOStruct> get vehicles => _vehicles ?? const [];
  set vehicles(List<VehicleDTOStruct>? val) => _vehicles = val;
  void updateVehicles(Function(List<VehicleDTOStruct>) updateFn) =>
      updateFn(_vehicles ??= []);
  bool hasVehicles() => _vehicles != null;

  static VehicleDTOListStruct fromMap(Map<String, dynamic> data) =>
      VehicleDTOListStruct(
        vehicles: getStructList(
          data['vehicles'],
          VehicleDTOStruct.fromMap,
        ),
      );

  static VehicleDTOListStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? VehicleDTOListStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'vehicles': _vehicles?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'vehicles': serializeParam(
          _vehicles,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static VehicleDTOListStruct fromSerializableMap(Map<String, dynamic> data) =>
      VehicleDTOListStruct(
        vehicles: deserializeStructParam<VehicleDTOStruct>(
          data['vehicles'],
          ParamType.DataStruct,
          true,
          structBuilder: VehicleDTOStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'VehicleDTOListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is VehicleDTOListStruct &&
        listEquality.equals(vehicles, other.vehicles);
  }

  @override
  int get hashCode => const ListEquality().hash([vehicles]);
}

VehicleDTOListStruct createVehicleDTOListStruct() => VehicleDTOListStruct();
