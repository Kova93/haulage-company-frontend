// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GetOrderDTOStruct extends BaseStruct {
  GetOrderDTOStruct({
    int? id,
    ShopDTOStruct? shopDTO,
    List<GetStackedGoodDTOStruct>? goodDTOs,
    int? transportOperationID,
  })  : _id = id,
        _shopDTO = shopDTO,
        _goodDTOs = goodDTOs,
        _transportOperationID = transportOperationID;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;
  void incrementId(int amount) => _id = id + amount;
  bool hasId() => _id != null;

  // "shopDTO" field.
  ShopDTOStruct? _shopDTO;
  ShopDTOStruct get shopDTO => _shopDTO ?? ShopDTOStruct();
  set shopDTO(ShopDTOStruct? val) => _shopDTO = val;
  void updateShopDTO(Function(ShopDTOStruct) updateFn) =>
      updateFn(_shopDTO ??= ShopDTOStruct());
  bool hasShopDTO() => _shopDTO != null;

  // "goodDTOs" field.
  List<GetStackedGoodDTOStruct>? _goodDTOs;
  List<GetStackedGoodDTOStruct> get goodDTOs => _goodDTOs ?? const [];
  set goodDTOs(List<GetStackedGoodDTOStruct>? val) => _goodDTOs = val;
  void updateGoodDTOs(Function(List<GetStackedGoodDTOStruct>) updateFn) =>
      updateFn(_goodDTOs ??= []);
  bool hasGoodDTOs() => _goodDTOs != null;

  // "transportOperationID" field.
  int? _transportOperationID;
  int get transportOperationID => _transportOperationID ?? 0;
  set transportOperationID(int? val) => _transportOperationID = val;
  void incrementTransportOperationID(int amount) =>
      _transportOperationID = transportOperationID + amount;
  bool hasTransportOperationID() => _transportOperationID != null;

  static GetOrderDTOStruct fromMap(Map<String, dynamic> data) =>
      GetOrderDTOStruct(
        id: castToType<int>(data['id']),
        shopDTO: ShopDTOStruct.maybeFromMap(data['shopDTO']),
        goodDTOs: getStructList(
          data['goodDTOs'],
          GetStackedGoodDTOStruct.fromMap,
        ),
        transportOperationID: castToType<int>(data['transportOperationID']),
      );

  static GetOrderDTOStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? GetOrderDTOStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'shopDTO': _shopDTO?.toMap(),
        'goodDTOs': _goodDTOs?.map((e) => e.toMap()).toList(),
        'transportOperationID': _transportOperationID,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'shopDTO': serializeParam(
          _shopDTO,
          ParamType.DataStruct,
        ),
        'goodDTOs': serializeParam(
          _goodDTOs,
          ParamType.DataStruct,
          true,
        ),
        'transportOperationID': serializeParam(
          _transportOperationID,
          ParamType.int,
        ),
      }.withoutNulls;

  static GetOrderDTOStruct fromSerializableMap(Map<String, dynamic> data) =>
      GetOrderDTOStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        shopDTO: deserializeStructParam(
          data['shopDTO'],
          ParamType.DataStruct,
          false,
          structBuilder: ShopDTOStruct.fromSerializableMap,
        ),
        goodDTOs: deserializeStructParam<GetStackedGoodDTOStruct>(
          data['goodDTOs'],
          ParamType.DataStruct,
          true,
          structBuilder: GetStackedGoodDTOStruct.fromSerializableMap,
        ),
        transportOperationID: deserializeParam(
          data['transportOperationID'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'GetOrderDTOStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is GetOrderDTOStruct &&
        id == other.id &&
        shopDTO == other.shopDTO &&
        listEquality.equals(goodDTOs, other.goodDTOs) &&
        transportOperationID == other.transportOperationID;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, shopDTO, goodDTOs, transportOperationID]);
}

GetOrderDTOStruct createGetOrderDTOStruct({
  int? id,
  ShopDTOStruct? shopDTO,
  int? transportOperationID,
}) =>
    GetOrderDTOStruct(
      id: id,
      shopDTO: shopDTO ?? ShopDTOStruct(),
      transportOperationID: transportOperationID,
    );
