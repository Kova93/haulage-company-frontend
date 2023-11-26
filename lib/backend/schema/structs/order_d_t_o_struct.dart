// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrderDTOStruct extends BaseStruct {
  OrderDTOStruct({
    int? id,
    int? shopID,
    List<StackedGoodDTOStruct>? stackedGoodDTOs,
    int? transportOperationID,
  })  : _id = id,
        _shopID = shopID,
        _stackedGoodDTOs = stackedGoodDTOs,
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

  // "stackedGoodDTOs" field.
  List<StackedGoodDTOStruct>? _stackedGoodDTOs;
  List<StackedGoodDTOStruct> get stackedGoodDTOs =>
      _stackedGoodDTOs ?? const [];
  set stackedGoodDTOs(List<StackedGoodDTOStruct>? val) =>
      _stackedGoodDTOs = val;
  void updateStackedGoodDTOs(Function(List<StackedGoodDTOStruct>) updateFn) =>
      updateFn(_stackedGoodDTOs ??= []);
  bool hasStackedGoodDTOs() => _stackedGoodDTOs != null;

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
        stackedGoodDTOs: getStructList(
          data['stackedGoodDTOs'],
          StackedGoodDTOStruct.fromMap,
        ),
        transportOperationID: castToType<int>(data['transportOperationID']),
      );

  static OrderDTOStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? OrderDTOStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'shopID': _shopID,
        'stackedGoodDTOs': _stackedGoodDTOs?.map((e) => e.toMap()).toList(),
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
        'stackedGoodDTOs': serializeParam(
          _stackedGoodDTOs,
          ParamType.DataStruct,
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
        stackedGoodDTOs: deserializeStructParam<StackedGoodDTOStruct>(
          data['stackedGoodDTOs'],
          ParamType.DataStruct,
          true,
          structBuilder: StackedGoodDTOStruct.fromSerializableMap,
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
        listEquality.equals(stackedGoodDTOs, other.stackedGoodDTOs) &&
        transportOperationID == other.transportOperationID;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, shopID, stackedGoodDTOs, transportOperationID]);
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
