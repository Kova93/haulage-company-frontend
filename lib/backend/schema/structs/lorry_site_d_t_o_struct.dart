// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LorrySiteDTOStruct extends BaseStruct {
  LorrySiteDTOStruct({
    int? id,
    String? name,
    String? address,
    List<GoodDTOStruct>? goodDTOs,
    List<VehicleDTOStruct>? vehicleDTOs,
  })  : _id = id,
        _name = name,
        _address = address,
        _goodDTOs = goodDTOs,
        _vehicleDTOs = vehicleDTOs;

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

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  set address(String? val) => _address = val;
  bool hasAddress() => _address != null;

  // "goodDTOs" field.
  List<GoodDTOStruct>? _goodDTOs;
  List<GoodDTOStruct> get goodDTOs => _goodDTOs ?? const [];
  set goodDTOs(List<GoodDTOStruct>? val) => _goodDTOs = val;
  void updateGoodDTOs(Function(List<GoodDTOStruct>) updateFn) =>
      updateFn(_goodDTOs ??= []);
  bool hasGoodDTOs() => _goodDTOs != null;

  // "vehicleDTOs" field.
  List<VehicleDTOStruct>? _vehicleDTOs;
  List<VehicleDTOStruct> get vehicleDTOs => _vehicleDTOs ?? const [];
  set vehicleDTOs(List<VehicleDTOStruct>? val) => _vehicleDTOs = val;
  void updateVehicleDTOs(Function(List<VehicleDTOStruct>) updateFn) =>
      updateFn(_vehicleDTOs ??= []);
  bool hasVehicleDTOs() => _vehicleDTOs != null;

  static LorrySiteDTOStruct fromMap(Map<String, dynamic> data) =>
      LorrySiteDTOStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        address: data['address'] as String?,
        goodDTOs: getStructList(
          data['goodDTOs'],
          GoodDTOStruct.fromMap,
        ),
        vehicleDTOs: getStructList(
          data['vehicleDTOs'],
          VehicleDTOStruct.fromMap,
        ),
      );

  static LorrySiteDTOStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? LorrySiteDTOStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'address': _address,
        'goodDTOs': _goodDTOs?.map((e) => e.toMap()).toList(),
        'vehicleDTOs': _vehicleDTOs?.map((e) => e.toMap()).toList(),
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
        'address': serializeParam(
          _address,
          ParamType.String,
        ),
        'goodDTOs': serializeParam(
          _goodDTOs,
          ParamType.DataStruct,
          true,
        ),
        'vehicleDTOs': serializeParam(
          _vehicleDTOs,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static LorrySiteDTOStruct fromSerializableMap(Map<String, dynamic> data) =>
      LorrySiteDTOStruct(
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
        address: deserializeParam(
          data['address'],
          ParamType.String,
          false,
        ),
        goodDTOs: deserializeStructParam<GoodDTOStruct>(
          data['goodDTOs'],
          ParamType.DataStruct,
          true,
          structBuilder: GoodDTOStruct.fromSerializableMap,
        ),
        vehicleDTOs: deserializeStructParam<VehicleDTOStruct>(
          data['vehicleDTOs'],
          ParamType.DataStruct,
          true,
          structBuilder: VehicleDTOStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'LorrySiteDTOStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is LorrySiteDTOStruct &&
        id == other.id &&
        name == other.name &&
        address == other.address &&
        listEquality.equals(goodDTOs, other.goodDTOs) &&
        listEquality.equals(vehicleDTOs, other.vehicleDTOs);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, name, address, goodDTOs, vehicleDTOs]);
}

LorrySiteDTOStruct createLorrySiteDTOStruct({
  int? id,
  String? name,
  String? address,
}) =>
    LorrySiteDTOStruct(
      id: id,
      name: name,
      address: address,
    );
