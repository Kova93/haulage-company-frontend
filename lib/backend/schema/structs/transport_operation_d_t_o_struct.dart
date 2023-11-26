// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TransportOperationDTOStruct extends BaseStruct {
  TransportOperationDTOStruct({
    int? id,
    DateTime? date,
    List<VehicleDTOStruct>? usedVehicleDTOs,
    GetOrderDTOStruct? orderDTO,
  })  : _id = id,
        _date = date,
        _usedVehicleDTOs = usedVehicleDTOs,
        _orderDTO = orderDTO;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;
  void incrementId(int amount) => _id = id + amount;
  bool hasId() => _id != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;
  bool hasDate() => _date != null;

  // "usedVehicleDTOs" field.
  List<VehicleDTOStruct>? _usedVehicleDTOs;
  List<VehicleDTOStruct> get usedVehicleDTOs => _usedVehicleDTOs ?? const [];
  set usedVehicleDTOs(List<VehicleDTOStruct>? val) => _usedVehicleDTOs = val;
  void updateUsedVehicleDTOs(Function(List<VehicleDTOStruct>) updateFn) =>
      updateFn(_usedVehicleDTOs ??= []);
  bool hasUsedVehicleDTOs() => _usedVehicleDTOs != null;

  // "orderDTO" field.
  GetOrderDTOStruct? _orderDTO;
  GetOrderDTOStruct get orderDTO => _orderDTO ?? GetOrderDTOStruct();
  set orderDTO(GetOrderDTOStruct? val) => _orderDTO = val;
  void updateOrderDTO(Function(GetOrderDTOStruct) updateFn) =>
      updateFn(_orderDTO ??= GetOrderDTOStruct());
  bool hasOrderDTO() => _orderDTO != null;

  static TransportOperationDTOStruct fromMap(Map<String, dynamic> data) =>
      TransportOperationDTOStruct(
        id: castToType<int>(data['id']),
        date: safeCastToDateTime(data['date']),
        usedVehicleDTOs: getStructList(
          data['usedVehicleDTOs'],
          VehicleDTOStruct.fromMap,
        ),
        orderDTO: GetOrderDTOStruct.maybeFromMap(data['orderDTO']),
      );

  static TransportOperationDTOStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic>
          ? TransportOperationDTOStruct.fromMap(data)
          : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'date': _date?.toIso8601String(),
        'usedVehicleDTOs': _usedVehicleDTOs?.map((e) => e.toMap()).toList(),
        'orderDTO': _orderDTO?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
        'usedVehicleDTOs': serializeParam(
          _usedVehicleDTOs,
          ParamType.DataStruct,
          true,
        ),
        'orderDTO': serializeParam(
          _orderDTO,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static TransportOperationDTOStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      TransportOperationDTOStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        usedVehicleDTOs: deserializeStructParam<VehicleDTOStruct>(
          data['usedVehicleDTOs'],
          ParamType.DataStruct,
          true,
          structBuilder: VehicleDTOStruct.fromSerializableMap,
        ),
        orderDTO: deserializeStructParam(
          data['orderDTO'],
          ParamType.DataStruct,
          false,
          structBuilder: GetOrderDTOStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'TransportOperationDTOStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is TransportOperationDTOStruct &&
        id == other.id &&
        date == other.date &&
        listEquality.equals(usedVehicleDTOs, other.usedVehicleDTOs) &&
        orderDTO == other.orderDTO;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, date, usedVehicleDTOs, orderDTO]);
}

TransportOperationDTOStruct createTransportOperationDTOStruct({
  int? id,
  DateTime? date,
  GetOrderDTOStruct? orderDTO,
}) =>
    TransportOperationDTOStruct(
      id: id,
      date: date,
      orderDTO: orderDTO ?? GetOrderDTOStruct(),
    );
