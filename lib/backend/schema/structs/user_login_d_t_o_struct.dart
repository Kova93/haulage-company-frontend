// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserLoginDTOStruct extends BaseStruct {
  UserLoginDTOStruct({
    String? username,
    String? password,
  })  : _username = username,
        _password = password;

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  set username(String? val) => _username = val;
  bool hasUsername() => _username != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  set password(String? val) => _password = val;
  bool hasPassword() => _password != null;

  static UserLoginDTOStruct fromMap(Map<String, dynamic> data) =>
      UserLoginDTOStruct(
        username: data['username'] as String?,
        password: data['password'] as String?,
      );

  static UserLoginDTOStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? UserLoginDTOStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'username': _username,
        'password': _password,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'username': serializeParam(
          _username,
          ParamType.String,
        ),
        'password': serializeParam(
          _password,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserLoginDTOStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserLoginDTOStruct(
        username: deserializeParam(
          data['username'],
          ParamType.String,
          false,
        ),
        password: deserializeParam(
          data['password'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserLoginDTOStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserLoginDTOStruct &&
        username == other.username &&
        password == other.password;
  }

  @override
  int get hashCode => const ListEquality().hash([username, password]);
}

UserLoginDTOStruct createUserLoginDTOStruct({
  String? username,
  String? password,
}) =>
    UserLoginDTOStruct(
      username: username,
      password: password,
    );
