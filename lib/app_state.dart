import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<LocationStruct> _dummyLocations = [
    LocationStruct.fromSerializableMap(jsonDecode(
        '{"id":"1","name":"MyLocation_1","address":"SomeAddress_1"}')),
    LocationStruct.fromSerializableMap(jsonDecode(
        '{"id":"2","name":"MyLocation_2","address":"SomeAddress_2"}')),
    LocationStruct.fromSerializableMap(jsonDecode(
        '{"id":"3","name":"MyLocation_3","address":"SomeAddress_3"}'))
  ];
  List<LocationStruct> get dummyLocations => _dummyLocations;
  set dummyLocations(List<LocationStruct> value) {
    _dummyLocations = value;
  }

  void addToDummyLocations(LocationStruct value) {
    _dummyLocations.add(value);
  }

  void removeFromDummyLocations(LocationStruct value) {
    _dummyLocations.remove(value);
  }

  void removeAtIndexFromDummyLocations(int index) {
    _dummyLocations.removeAt(index);
  }

  void updateDummyLocationsAtIndex(
    int index,
    LocationStruct Function(LocationStruct) updateFn,
  ) {
    _dummyLocations[index] = updateFn(_dummyLocations[index]);
  }

  void insertAtIndexInDummyLocations(int index, LocationStruct value) {
    _dummyLocations.insert(index, value);
  }

  List<VehicleStruct> _dummyVehicles = [
    VehicleStruct.fromSerializableMap(jsonDecode(
        '{"id":"1","licensePlate":"MyLicensePlate_1","name":"SomeBrandName_1","type":"SomeType_1"}')),
    VehicleStruct.fromSerializableMap(jsonDecode(
        '{"id":"2","licensePlate":"MyLicensePlate_2","name":"SomeBrandName_2","type":"SomeType_2"}')),
    VehicleStruct.fromSerializableMap(jsonDecode(
        '{"id":"3","licensePlate":"MyLicensePlate_3","name":"SomeBrandName_3","type":"SomeType_3"}'))
  ];
  List<VehicleStruct> get dummyVehicles => _dummyVehicles;
  set dummyVehicles(List<VehicleStruct> value) {
    _dummyVehicles = value;
  }

  void addToDummyVehicles(VehicleStruct value) {
    _dummyVehicles.add(value);
  }

  void removeFromDummyVehicles(VehicleStruct value) {
    _dummyVehicles.remove(value);
  }

  void removeAtIndexFromDummyVehicles(int index) {
    _dummyVehicles.removeAt(index);
  }

  void updateDummyVehiclesAtIndex(
    int index,
    VehicleStruct Function(VehicleStruct) updateFn,
  ) {
    _dummyVehicles[index] = updateFn(_dummyVehicles[index]);
  }

  void insertAtIndexInDummyVehicles(int index, VehicleStruct value) {
    _dummyVehicles.insert(index, value);
  }

  List<ShopStruct> _dummyShops = [];
  List<ShopStruct> get dummyShops => _dummyShops;
  set dummyShops(List<ShopStruct> value) {
    _dummyShops = value;
  }

  void addToDummyShops(ShopStruct value) {
    _dummyShops.add(value);
  }

  void removeFromDummyShops(ShopStruct value) {
    _dummyShops.remove(value);
  }

  void removeAtIndexFromDummyShops(int index) {
    _dummyShops.removeAt(index);
  }

  void updateDummyShopsAtIndex(
    int index,
    ShopStruct Function(ShopStruct) updateFn,
  ) {
    _dummyShops[index] = updateFn(_dummyShops[index]);
  }

  void insertAtIndexInDummyShops(int index, ShopStruct value) {
    _dummyShops.insert(index, value);
  }

  List<GoodStruct> _dummyGoods = [
    GoodStruct.fromSerializableMap(jsonDecode(
        '{"id":"1","name":"MyGood_1","description":"SomeDescription_1","price":"1.2"}')),
    GoodStruct.fromSerializableMap(jsonDecode(
        '{"id":"2","name":"MyGood_2","description":"SomeDescription_2","price":"2.3"}')),
    GoodStruct.fromSerializableMap(jsonDecode(
        '{"id":"3","name":"MyGood_3","description":"SomeDescription_3","price":"3.4"}'))
  ];
  List<GoodStruct> get dummyGoods => _dummyGoods;
  set dummyGoods(List<GoodStruct> value) {
    _dummyGoods = value;
  }

  void addToDummyGoods(GoodStruct value) {
    _dummyGoods.add(value);
  }

  void removeFromDummyGoods(GoodStruct value) {
    _dummyGoods.remove(value);
  }

  void removeAtIndexFromDummyGoods(int index) {
    _dummyGoods.removeAt(index);
  }

  void updateDummyGoodsAtIndex(
    int index,
    GoodStruct Function(GoodStruct) updateFn,
  ) {
    _dummyGoods[index] = updateFn(_dummyGoods[index]);
  }

  void insertAtIndexInDummyGoods(int index, GoodStruct value) {
    _dummyGoods.insert(index, value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
