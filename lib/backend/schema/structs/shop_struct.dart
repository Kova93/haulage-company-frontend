// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ShopStruct extends BaseStruct {
  ShopStruct({
    int? id,
    String? name,
    int? locationId,
    String? contact,
  })  : _id = id,
        _name = name,
        _locationId = locationId,
        _contact = contact;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;
  void incrementId(int amount) => _id = id + amount;
  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "locationId" field.
  int? _locationId;
  int get locationId => _locationId ?? 0;
  set locationId(int? val) => _locationId = val;
  void incrementLocationId(int amount) => _locationId = locationId + amount;
  bool hasLocationId() => _locationId != null;

  // "contact" field.
  String? _contact;
  String get contact => _contact ?? '';
  set contact(String? val) => _contact = val;
  bool hasContact() => _contact != null;

  static ShopStruct fromMap(Map<String, dynamic> data) => ShopStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        locationId: castToType<int>(data['locationId']),
        contact: data['contact'] as String?,
      );

  static ShopStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? ShopStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'locationId': _locationId,
        'contact': _contact,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'locationId': serializeParam(
          _locationId,
          ParamType.int,
        ),
        'contact': serializeParam(
          _contact,
          ParamType.String,
        ),
      }.withoutNulls;

  static ShopStruct fromSerializableMap(Map<String, dynamic> data) =>
      ShopStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        locationId: deserializeParam(
          data['locationId'],
          ParamType.int,
          false,
        ),
        contact: deserializeParam(
          data['contact'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ShopStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ShopStruct &&
        id == other.id &&
        name == other.name &&
        locationId == other.locationId &&
        contact == other.contact;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, name, locationId, contact]);
}

ShopStruct createShopStruct({
  int? id,
  String? name,
  int? locationId,
  String? contact,
}) =>
    ShopStruct(
      id: id,
      name: name,
      locationId: locationId,
      contact: contact,
    );
