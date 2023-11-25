// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserDTOStruct extends BaseStruct {
  UserDTOStruct({
    int? id,
    String? name,
    String? username,
    DateTime? entryDate,
    List<String>? roles,
  })  : _id = id,
        _name = name,
        _username = username,
        _entryDate = entryDate,
        _roles = roles;

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

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  set username(String? val) => _username = val;
  bool hasUsername() => _username != null;

  // "entryDate" field.
  DateTime? _entryDate;
  DateTime? get entryDate => _entryDate;
  set entryDate(DateTime? val) => _entryDate = val;
  bool hasEntryDate() => _entryDate != null;

  // "roles" field.
  List<String>? _roles;
  List<String> get roles => _roles ?? const [];
  set roles(List<String>? val) => _roles = val;
  void updateRoles(Function(List<String>) updateFn) => updateFn(_roles ??= []);
  bool hasRoles() => _roles != null;

  static UserDTOStruct fromMap(Map<String, dynamic> data) => UserDTOStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        username: data['username'] as String?,
        entryDate: data['entryDate'] as DateTime?,
        roles: getDataList(data['roles']),
      );

  static UserDTOStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? UserDTOStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'username': _username,
        'entryDate': _entryDate,
        'roles': _roles,
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
        'username': serializeParam(
          _username,
          ParamType.String,
        ),
        'entryDate': serializeParam(
          _entryDate,
          ParamType.DateTime,
        ),
        'roles': serializeParam(
          _roles,
          ParamType.String,
          true,
        ),
      }.withoutNulls;

  static UserDTOStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserDTOStruct(
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
        username: deserializeParam(
          data['username'],
          ParamType.String,
          false,
        ),
        entryDate: deserializeParam(
          data['entryDate'],
          ParamType.DateTime,
          false,
        ),
        roles: deserializeParam<String>(
          data['roles'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'UserDTOStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is UserDTOStruct &&
        id == other.id &&
        name == other.name &&
        username == other.username &&
        entryDate == other.entryDate &&
        listEquality.equals(roles, other.roles);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, name, username, entryDate, roles]);
}

UserDTOStruct createUserDTOStruct({
  int? id,
  String? name,
  String? username,
  DateTime? entryDate,
}) =>
    UserDTOStruct(
      id: id,
      name: name,
      username: username,
      entryDate: entryDate,
    );
