// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VehicleStruct extends BaseStruct {
  VehicleStruct({
    int? id,
    String? licensePlate,
    String? name,
    String? type,
  })  : _id = id,
        _licensePlate = licensePlate,
        _name = name,
        _type = type;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;
  void incrementId(int amount) => _id = id + amount;
  bool hasId() => _id != null;

  // "licensePlate" field.
  String? _licensePlate;
  String get licensePlate => _licensePlate ?? '';
  set licensePlate(String? val) => _licensePlate = val;
  bool hasLicensePlate() => _licensePlate != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;
  bool hasType() => _type != null;

  static VehicleStruct fromMap(Map<String, dynamic> data) => VehicleStruct(
        id: castToType<int>(data['id']),
        licensePlate: data['licensePlate'] as String?,
        name: data['name'] as String?,
        type: data['type'] as String?,
      );

  static VehicleStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? VehicleStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'licensePlate': _licensePlate,
        'name': _name,
        'type': _type,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'licensePlate': serializeParam(
          _licensePlate,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
      }.withoutNulls;

  static VehicleStruct fromSerializableMap(Map<String, dynamic> data) =>
      VehicleStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        licensePlate: deserializeParam(
          data['licensePlate'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'VehicleStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is VehicleStruct &&
        id == other.id &&
        licensePlate == other.licensePlate &&
        name == other.name &&
        type == other.type;
  }

  @override
  int get hashCode => const ListEquality().hash([id, licensePlate, name, type]);
}

VehicleStruct createVehicleStruct({
  int? id,
  String? licensePlate,
  String? name,
  String? type,
}) =>
    VehicleStruct(
      id: id,
      licensePlate: licensePlate,
      name: name,
      type: type,
    );
