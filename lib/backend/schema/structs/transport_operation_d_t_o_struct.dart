// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TransportOperationDTOStruct extends BaseStruct {
  TransportOperationDTOStruct({
    int? id,
    DateTime? date,
    List<int>? usedVehicleIDs,
    int? orderID,
  })  : _id = id,
        _date = date,
        _usedVehicleIDs = usedVehicleIDs,
        _orderID = orderID;

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

  // "usedVehicleIDs" field.
  List<int>? _usedVehicleIDs;
  List<int> get usedVehicleIDs => _usedVehicleIDs ?? const [];
  set usedVehicleIDs(List<int>? val) => _usedVehicleIDs = val;
  void updateUsedVehicleIDs(Function(List<int>) updateFn) =>
      updateFn(_usedVehicleIDs ??= []);
  bool hasUsedVehicleIDs() => _usedVehicleIDs != null;

  // "orderID" field.
  int? _orderID;
  int get orderID => _orderID ?? 0;
  set orderID(int? val) => _orderID = val;
  void incrementOrderID(int amount) => _orderID = orderID + amount;
  bool hasOrderID() => _orderID != null;

  static TransportOperationDTOStruct fromMap(Map<String, dynamic> data) =>
      TransportOperationDTOStruct(
        id: castToType<int>(data['id']),
        date: data['date'] as DateTime?,
        usedVehicleIDs: getDataList(data['usedVehicleIDs']),
        orderID: castToType<int>(data['orderID']),
      );

  static TransportOperationDTOStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic>
          ? TransportOperationDTOStruct.fromMap(data)
          : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'date': _date,
        'usedVehicleIDs': _usedVehicleIDs,
        'orderID': _orderID,
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
        'usedVehicleIDs': serializeParam(
          _usedVehicleIDs,
          ParamType.int,
          true,
        ),
        'orderID': serializeParam(
          _orderID,
          ParamType.int,
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
        usedVehicleIDs: deserializeParam<int>(
          data['usedVehicleIDs'],
          ParamType.int,
          true,
        ),
        orderID: deserializeParam(
          data['orderID'],
          ParamType.int,
          false,
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
        listEquality.equals(usedVehicleIDs, other.usedVehicleIDs) &&
        orderID == other.orderID;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, date, usedVehicleIDs, orderID]);
}

TransportOperationDTOStruct createTransportOperationDTOStruct({
  int? id,
  DateTime? date,
  int? orderID,
}) =>
    TransportOperationDTOStruct(
      id: id,
      date: date,
      orderID: orderID,
    );
