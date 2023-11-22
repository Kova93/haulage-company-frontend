// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GoodStruct extends BaseStruct {
  GoodStruct({
    int? id,
    String? name,
    String? description,
    double? price,
  })  : _id = id,
        _name = name,
        _description = description,
        _price = price;

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

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  set price(double? val) => _price = val;
  void incrementPrice(double amount) => _price = price + amount;
  bool hasPrice() => _price != null;

  static GoodStruct fromMap(Map<String, dynamic> data) => GoodStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        description: data['description'] as String?,
        price: castToType<double>(data['price']),
      );

  static GoodStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? GoodStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'description': _description,
        'price': _price,
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
        'price': serializeParam(
          _price,
          ParamType.double,
        ),
      }.withoutNulls;

  static GoodStruct fromSerializableMap(Map<String, dynamic> data) =>
      GoodStruct(
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
        price: deserializeParam(
          data['price'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'GoodStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GoodStruct &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        price == other.price;
  }

  @override
  int get hashCode => const ListEquality().hash([id, name, description, price]);
}

GoodStruct createGoodStruct({
  int? id,
  String? name,
  String? description,
  double? price,
}) =>
    GoodStruct(
      id: id,
      name: name,
      description: description,
      price: price,
    );
