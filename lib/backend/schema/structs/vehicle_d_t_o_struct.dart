// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VehicleDTOStruct extends BaseStruct {
  VehicleDTOStruct({
    int? id,
    String? licensePlate,
    double? size,
    double? maxWeight,
    int? lorrySiteID,
    List<TransportOperationDTOStruct>? transportOperationDTOs,
  })  : _id = id,
        _licensePlate = licensePlate,
        _size = size,
        _maxWeight = maxWeight,
        _lorrySiteID = lorrySiteID,
        _transportOperationDTOs = transportOperationDTOs;

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

  // "size" field.
  double? _size;
  double get size => _size ?? 0.0;
  set size(double? val) => _size = val;
  void incrementSize(double amount) => _size = size + amount;
  bool hasSize() => _size != null;

  // "maxWeight" field.
  double? _maxWeight;
  double get maxWeight => _maxWeight ?? 0.0;
  set maxWeight(double? val) => _maxWeight = val;
  void incrementMaxWeight(double amount) => _maxWeight = maxWeight + amount;
  bool hasMaxWeight() => _maxWeight != null;

  // "lorrySiteID" field.
  int? _lorrySiteID;
  int get lorrySiteID => _lorrySiteID ?? 0;
  set lorrySiteID(int? val) => _lorrySiteID = val;
  void incrementLorrySiteID(int amount) => _lorrySiteID = lorrySiteID + amount;
  bool hasLorrySiteID() => _lorrySiteID != null;

  // "transportOperationDTOs" field.
  List<TransportOperationDTOStruct>? _transportOperationDTOs;
  List<TransportOperationDTOStruct> get transportOperationDTOs =>
      _transportOperationDTOs ?? const [];
  set transportOperationDTOs(List<TransportOperationDTOStruct>? val) =>
      _transportOperationDTOs = val;
  void updateTransportOperationDTOs(
          Function(List<TransportOperationDTOStruct>) updateFn) =>
      updateFn(_transportOperationDTOs ??= []);
  bool hasTransportOperationDTOs() => _transportOperationDTOs != null;

  static VehicleDTOStruct fromMap(Map<String, dynamic> data) =>
      VehicleDTOStruct(
        id: castToType<int>(data['id']),
        licensePlate: data['licensePlate'] as String?,
        size: castToType<double>(data['size']),
        maxWeight: castToType<double>(data['maxWeight']),
        lorrySiteID: castToType<int>(data['lorrySiteID']),
        transportOperationDTOs: getStructList(
          data['transportOperationDTOs'],
          TransportOperationDTOStruct.fromMap,
        ),
      );

  static VehicleDTOStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? VehicleDTOStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'licensePlate': _licensePlate,
        'size': _size,
        'maxWeight': _maxWeight,
        'lorrySiteID': _lorrySiteID,
        'transportOperationDTOs':
            _transportOperationDTOs?.map((e) => e.toMap()).toList(),
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
        'size': serializeParam(
          _size,
          ParamType.double,
        ),
        'maxWeight': serializeParam(
          _maxWeight,
          ParamType.double,
        ),
        'lorrySiteID': serializeParam(
          _lorrySiteID,
          ParamType.int,
        ),
        'transportOperationDTOs': serializeParam(
          _transportOperationDTOs,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static VehicleDTOStruct fromSerializableMap(Map<String, dynamic> data) =>
      VehicleDTOStruct(
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
        size: deserializeParam(
          data['size'],
          ParamType.double,
          false,
        ),
        maxWeight: deserializeParam(
          data['maxWeight'],
          ParamType.double,
          false,
        ),
        lorrySiteID: deserializeParam(
          data['lorrySiteID'],
          ParamType.int,
          false,
        ),
        transportOperationDTOs:
            deserializeStructParam<TransportOperationDTOStruct>(
          data['transportOperationDTOs'],
          ParamType.DataStruct,
          true,
          structBuilder: TransportOperationDTOStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'VehicleDTOStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is VehicleDTOStruct &&
        id == other.id &&
        licensePlate == other.licensePlate &&
        size == other.size &&
        maxWeight == other.maxWeight &&
        lorrySiteID == other.lorrySiteID &&
        listEquality.equals(
            transportOperationDTOs, other.transportOperationDTOs);
  }

  @override
  int get hashCode => const ListEquality().hash(
      [id, licensePlate, size, maxWeight, lorrySiteID, transportOperationDTOs]);
}

VehicleDTOStruct createVehicleDTOStruct({
  int? id,
  String? licensePlate,
  double? size,
  double? maxWeight,
  int? lorrySiteID,
}) =>
    VehicleDTOStruct(
      id: id,
      licensePlate: licensePlate,
      size: size,
      maxWeight: maxWeight,
      lorrySiteID: lorrySiteID,
    );
