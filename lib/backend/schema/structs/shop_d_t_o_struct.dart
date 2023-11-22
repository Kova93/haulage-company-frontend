// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ShopDTOStruct extends BaseStruct {
  ShopDTOStruct({
    int? id,
    String? name,
    String? address,
    List<int>? orderIDs,
  })  : _id = id,
        _name = name,
        _address = address,
        _orderIDs = orderIDs;

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

  // "orderIDs" field.
  List<int>? _orderIDs;
  List<int> get orderIDs => _orderIDs ?? const [];
  set orderIDs(List<int>? val) => _orderIDs = val;
  void updateOrderIDs(Function(List<int>) updateFn) =>
      updateFn(_orderIDs ??= []);
  bool hasOrderIDs() => _orderIDs != null;

  static ShopDTOStruct fromMap(Map<String, dynamic> data) => ShopDTOStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        address: data['address'] as String?,
        orderIDs: getDataList(data['orderIDs']),
      );

  static ShopDTOStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? ShopDTOStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'address': _address,
        'orderIDs': _orderIDs,
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
        'orderIDs': serializeParam(
          _orderIDs,
          ParamType.int,
          true,
        ),
      }.withoutNulls;

  static ShopDTOStruct fromSerializableMap(Map<String, dynamic> data) =>
      ShopDTOStruct(
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
        orderIDs: deserializeParam<int>(
          data['orderIDs'],
          ParamType.int,
          true,
        ),
      );

  @override
  String toString() => 'ShopDTOStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ShopDTOStruct &&
        id == other.id &&
        name == other.name &&
        address == other.address &&
        listEquality.equals(orderIDs, other.orderIDs);
  }

  @override
  int get hashCode => const ListEquality().hash([id, name, address, orderIDs]);
}

ShopDTOStruct createShopDTOStruct({
  int? id,
  String? name,
  String? address,
}) =>
    ShopDTOStruct(
      id: id,
      name: name,
      address: address,
    );
