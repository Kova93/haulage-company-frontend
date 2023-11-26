// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StackedGoodDTOStruct extends BaseStruct {
  StackedGoodDTOStruct({
    int? goodId,
    int? quantity,
  })  : _goodId = goodId,
        _quantity = quantity;

  // "goodId" field.
  int? _goodId;
  int get goodId => _goodId ?? 0;
  set goodId(int? val) => _goodId = val;
  void incrementGoodId(int amount) => _goodId = goodId + amount;
  bool hasGoodId() => _goodId != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  set quantity(int? val) => _quantity = val;
  void incrementQuantity(int amount) => _quantity = quantity + amount;
  bool hasQuantity() => _quantity != null;

  static StackedGoodDTOStruct fromMap(Map<String, dynamic> data) =>
      StackedGoodDTOStruct(
        goodId: castToType<int>(data['goodId']),
        quantity: castToType<int>(data['quantity']),
      );

  static StackedGoodDTOStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? StackedGoodDTOStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'goodId': _goodId,
        'quantity': _quantity,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'goodId': serializeParam(
          _goodId,
          ParamType.int,
        ),
        'quantity': serializeParam(
          _quantity,
          ParamType.int,
        ),
      }.withoutNulls;

  static StackedGoodDTOStruct fromSerializableMap(Map<String, dynamic> data) =>
      StackedGoodDTOStruct(
        goodId: deserializeParam(
          data['goodId'],
          ParamType.int,
          false,
        ),
        quantity: deserializeParam(
          data['quantity'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'StackedGoodDTOStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StackedGoodDTOStruct &&
        goodId == other.goodId &&
        quantity == other.quantity;
  }

  @override
  int get hashCode => const ListEquality().hash([goodId, quantity]);
}

StackedGoodDTOStruct createStackedGoodDTOStruct({
  int? goodId,
  int? quantity,
}) =>
    StackedGoodDTOStruct(
      goodId: goodId,
      quantity: quantity,
    );
