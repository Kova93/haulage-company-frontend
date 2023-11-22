// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LorrySiteDTOListStruct extends BaseStruct {
  LorrySiteDTOListStruct({
    List<LorrySiteDTOStruct>? sites,
  }) : _sites = sites;

  // "sites" field.
  List<LorrySiteDTOStruct>? _sites;
  List<LorrySiteDTOStruct> get sites => _sites ?? const [];
  set sites(List<LorrySiteDTOStruct>? val) => _sites = val;
  void updateSites(Function(List<LorrySiteDTOStruct>) updateFn) =>
      updateFn(_sites ??= []);
  bool hasSites() => _sites != null;

  static LorrySiteDTOListStruct fromMap(Map<String, dynamic> data) =>
      LorrySiteDTOListStruct(
        sites: getStructList(
          data['sites'],
          LorrySiteDTOStruct.fromMap,
        ),
      );

  static LorrySiteDTOListStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic>
          ? LorrySiteDTOListStruct.fromMap(data)
          : null;

  Map<String, dynamic> toMap() => {
        'sites': _sites?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'sites': serializeParam(
          _sites,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static LorrySiteDTOListStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      LorrySiteDTOListStruct(
        sites: deserializeStructParam<LorrySiteDTOStruct>(
          data['sites'],
          ParamType.DataStruct,
          true,
          structBuilder: LorrySiteDTOStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'LorrySiteDTOListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is LorrySiteDTOListStruct &&
        listEquality.equals(sites, other.sites);
  }

  @override
  int get hashCode => const ListEquality().hash([sites]);
}

LorrySiteDTOListStruct createLorrySiteDTOListStruct() =>
    LorrySiteDTOListStruct();
