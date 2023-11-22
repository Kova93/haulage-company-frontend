// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GoodDTOStruct extends BaseStruct {
  GoodDTOStruct({
    int? id,
    String? name,
    String? description,
    double? size,
    double? weight,
    int? quantity,
  })  : _id = id,
        _name = name,
        _description = description,
        _size = size,
        _weight = weight,
        _quantity = quantity;

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

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;
  bool hasDescription() => _description != null;

  // "size" field.
  double? _size;
  double get size => _size ?? 0.0;
  set size(double? val) => _size = val;
  void incrementSize(double amount) => _size = size + amount;
  bool hasSize() => _size != null;

  // "weight" field.
  double? _weight;
  double get weight => _weight ?? 0.0;
  set weight(double? val) => _weight = val;
  void incrementWeight(double amount) => _weight = weight + amount;
  bool hasWeight() => _weight != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  set quantity(int? val) => _quantity = val;
  void incrementQuantity(int amount) => _quantity = quantity + amount;
  bool hasQuantity() => _quantity != null;

  static GoodDTOStruct fromMap(Map<String, dynamic> data) => GoodDTOStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        description: data['description'] as String?,
        size: castToType<double>(data['size']),
        weight: castToType<double>(data['weight']),
        quantity: castToType<int>(data['quantity']),
      );

  static GoodDTOStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? GoodDTOStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'description': _description,
        'size': _size,
        'weight': _weight,
        'quantity': _quantity,
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
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'size': serializeParam(
          _size,
          ParamType.double,
        ),
        'weight': serializeParam(
          _weight,
          ParamType.double,
        ),
        'quantity': serializeParam(
          _quantity,
          ParamType.int,
        ),
      }.withoutNulls;

  static GoodDTOStruct fromSerializableMap(Map<String, dynamic> data) =>
      GoodDTOStruct(
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
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        size: deserializeParam(
          data['size'],
          ParamType.double,
          false,
        ),
        weight: deserializeParam(
          data['weight'],
          ParamType.double,
          false,
        ),
        quantity: deserializeParam(
          data['quantity'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'GoodDTOStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GoodDTOStruct &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        size == other.size &&
        weight == other.weight &&
        quantity == other.quantity;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, name, description, size, weight, quantity]);
}

GoodDTOStruct createGoodDTOStruct({
  int? id,
  String? name,
  String? description,
  double? size,
  double? weight,
  int? quantity,
}) =>
    GoodDTOStruct(
      id: id,
      name: name,
      description: description,
      size: size,
      weight: weight,
      quantity: quantity,
    );
