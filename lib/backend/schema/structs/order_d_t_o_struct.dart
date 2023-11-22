// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrderDTOStruct extends BaseStruct {
  OrderDTOStruct({
    int? id,
    int? shopID,
    List<int>? goodIDs,
    int? transportOperationID,
  })  : _id = id,
        _shopID = shopID,
        _goodIDs = goodIDs,
        _transportOperationID = transportOperationID;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;
  void incrementId(int amount) => _id = id + amount;
  bool hasId() => _id != null;

  // "shopID" field.
  int? _shopID;
  int get shopID => _shopID ?? 0;
  set shopID(int? val) => _shopID = val;
  void incrementShopID(int amount) => _shopID = shopID + amount;
  bool hasShopID() => _shopID != null;

  // "goodIDs" field.
  List<int>? _goodIDs;
  List<int> get goodIDs => _goodIDs ?? const [];
  set goodIDs(List<int>? val) => _goodIDs = val;
  void updateGoodIDs(Function(List<int>) updateFn) => updateFn(_goodIDs ??= []);
  bool hasGoodIDs() => _goodIDs != null;

  // "transportOperationID" field.
  int? _transportOperationID;
  int get transportOperationID => _transportOperationID ?? 0;
  set transportOperationID(int? val) => _transportOperationID = val;
  void incrementTransportOperationID(int amount) =>
      _transportOperationID = transportOperationID + amount;
  bool hasTransportOperationID() => _transportOperationID != null;

  static OrderDTOStruct fromMap(Map<String, dynamic> data) => OrderDTOStruct(
        id: castToType<int>(data['id']),
        shopID: castToType<int>(data['shopID']),
        goodIDs: getDataList(data['goodIDs']),
        transportOperationID: castToType<int>(data['transportOperationID']),
      );

  static OrderDTOStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? OrderDTOStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'shopID': _shopID,
        'goodIDs': _goodIDs,
        'transportOperationID': _transportOperationID,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'shopID': serializeParam(
          _shopID,
          ParamType.int,
        ),
        'goodIDs': serializeParam(
          _goodIDs,
          ParamType.int,
          true,
        ),
        'transportOperationID': serializeParam(
          _transportOperationID,
          ParamType.int,
        ),
      }.withoutNulls;

  static OrderDTOStruct fromSerializableMap(Map<String, dynamic> data) =>
      OrderDTOStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        shopID: deserializeParam(
          data['shopID'],
          ParamType.int,
          false,
        ),
        goodIDs: deserializeParam<int>(
          data['goodIDs'],
          ParamType.int,
          true,
        ),
        transportOperationID: deserializeParam(
          data['transportOperationID'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'OrderDTOStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is OrderDTOStruct &&
        id == other.id &&
        shopID == other.shopID &&
        listEquality.equals(goodIDs, other.goodIDs) &&
        transportOperationID == other.transportOperationID;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, shopID, goodIDs, transportOperationID]);
}

OrderDTOStruct createOrderDTOStruct({
  int? id,
  int? shopID,
  int? transportOperationID,
}) =>
    OrderDTOStruct(
      id: id,
      shopID: shopID,
      transportOperationID: transportOperationID,
    );
