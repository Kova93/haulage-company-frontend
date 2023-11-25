// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AuthResponseDTOStruct extends BaseStruct {
  AuthResponseDTOStruct({
    int? id,
    String? accessToken,
  })  : _id = id,
        _accessToken = accessToken;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;
  void incrementId(int amount) => _id = id + amount;
  bool hasId() => _id != null;

  // "accessToken" field.
  String? _accessToken;
  String get accessToken => _accessToken ?? '';
  set accessToken(String? val) => _accessToken = val;
  bool hasAccessToken() => _accessToken != null;

  static AuthResponseDTOStruct fromMap(Map<String, dynamic> data) =>
      AuthResponseDTOStruct(
        id: castToType<int>(data['id']),
        accessToken: data['accessToken'] as String?,
      );

  static AuthResponseDTOStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? AuthResponseDTOStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'accessToken': _accessToken,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'accessToken': serializeParam(
          _accessToken,
          ParamType.String,
        ),
      }.withoutNulls;

  static AuthResponseDTOStruct fromSerializableMap(Map<String, dynamic> data) =>
      AuthResponseDTOStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        accessToken: deserializeParam(
          data['accessToken'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AuthResponseDTOStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AuthResponseDTOStruct &&
        id == other.id &&
        accessToken == other.accessToken;
  }

  @override
  int get hashCode => const ListEquality().hash([id, accessToken]);
}

AuthResponseDTOStruct createAuthResponseDTOStruct({
  int? id,
  String? accessToken,
}) =>
    AuthResponseDTOStruct(
      id: id,
      accessToken: accessToken,
    );
