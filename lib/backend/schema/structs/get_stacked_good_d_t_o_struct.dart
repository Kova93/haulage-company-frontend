// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GetStackedGoodDTOStruct extends BaseStruct {
  GetStackedGoodDTOStruct({
    GoodDTOStruct? goodDTO,
    int? quantity,
  })  : _goodDTO = goodDTO,
        _quantity = quantity;

  // "goodDTO" field.
  GoodDTOStruct? _goodDTO;
  GoodDTOStruct get goodDTO => _goodDTO ?? GoodDTOStruct();
  set goodDTO(GoodDTOStruct? val) => _goodDTO = val;
  void updateGoodDTO(Function(GoodDTOStruct) updateFn) =>
      updateFn(_goodDTO ??= GoodDTOStruct());
  bool hasGoodDTO() => _goodDTO != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  set quantity(int? val) => _quantity = val;
  void incrementQuantity(int amount) => _quantity = quantity + amount;
  bool hasQuantity() => _quantity != null;

  static GetStackedGoodDTOStruct fromMap(Map<String, dynamic> data) =>
      GetStackedGoodDTOStruct(
        goodDTO: GoodDTOStruct.maybeFromMap(data['goodDTO']),
        quantity: castToType<int>(data['quantity']),
      );

  static GetStackedGoodDTOStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic>
          ? GetStackedGoodDTOStruct.fromMap(data)
          : null;

  Map<String, dynamic> toMap() => {
        'goodDTO': _goodDTO?.toMap(),
        'quantity': _quantity,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'goodDTO': serializeParam(
          _goodDTO,
          ParamType.DataStruct,
        ),
        'quantity': serializeParam(
          _quantity,
          ParamType.int,
        ),
      }.withoutNulls;

  static GetStackedGoodDTOStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      GetStackedGoodDTOStruct(
        goodDTO: deserializeStructParam(
          data['goodDTO'],
          ParamType.DataStruct,
          false,
          structBuilder: GoodDTOStruct.fromSerializableMap,
        ),
        quantity: deserializeParam(
          data['quantity'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'GetStackedGoodDTOStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GetStackedGoodDTOStruct &&
        goodDTO == other.goodDTO &&
        quantity == other.quantity;
  }

  @override
  int get hashCode => const ListEquality().hash([goodDTO, quantity]);
}

GetStackedGoodDTOStruct createGetStackedGoodDTOStruct({
  GoodDTOStruct? goodDTO,
  int? quantity,
}) =>
    GetStackedGoodDTOStruct(
      goodDTO: goodDTO ?? GoodDTOStruct(),
      quantity: quantity,
    );
