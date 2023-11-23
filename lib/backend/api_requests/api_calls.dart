import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Haulage Company API Group Code

class HaulageCompanyAPIGroup {
  static String baseUrl = 'http://localhost:8080/api';
  static Map<String, String> headers = {};
  static GetAllGoodsCall getAllGoodsCall = GetAllGoodsCall();
  static CreateGoodCall createGoodCall = CreateGoodCall();
  static GetGoodByIdCall getGoodByIdCall = GetGoodByIdCall();
  static UpdateGoodCall updateGoodCall = UpdateGoodCall();
  static DeleteGoodCall deleteGoodCall = DeleteGoodCall();
  static CreateLocationCall createLocationCall = CreateLocationCall();
  static GetAllLocationsCall getAllLocationsCall = GetAllLocationsCall();
  static GetLocationByIdCall getLocationByIdCall = GetLocationByIdCall();
  static UpdateLocationCall updateLocationCall = UpdateLocationCall();
  static DeleteLocationCall deleteLocationCall = DeleteLocationCall();
  static CreateOrderCall createOrderCall = CreateOrderCall();
  static GetAllOrdersCall getAllOrdersCall = GetAllOrdersCall();
  static GetOrderByIdCall getOrderByIdCall = GetOrderByIdCall();
  static UpdateOrderCall updateOrderCall = UpdateOrderCall();
  static DeleteOrderCall deleteOrderCall = DeleteOrderCall();
  static CreateShopCall createShopCall = CreateShopCall();
  static GetAllShopsCall getAllShopsCall = GetAllShopsCall();
  static GetShopByIdCall getShopByIdCall = GetShopByIdCall();
  static UpdateShopCall updateShopCall = UpdateShopCall();
  static DeleteShopCall deleteShopCall = DeleteShopCall();
  static CreateTransportOperationCall createTransportOperationCall =
      CreateTransportOperationCall();
  static GetAllTransportOperationsCall getAllTransportOperationsCall =
      GetAllTransportOperationsCall();
  static GetTransportOperationByIdCall getTransportOperationByIdCall =
      GetTransportOperationByIdCall();
  static UpdateTransportOperationCall updateTransportOperationCall =
      UpdateTransportOperationCall();
  static DeleteTransportOperationCall deleteTransportOperationCall =
      DeleteTransportOperationCall();
  static CreateVehicleCall createVehicleCall = CreateVehicleCall();
  static GetAllVehiclesCall getAllVehiclesCall = GetAllVehiclesCall();
  static GetVehicleByIdCall getVehicleByIdCall = GetVehicleByIdCall();
  static UpdateVehicleCall updateVehicleCall = UpdateVehicleCall();
  static DeleteVehicleCall deleteVehicleCall = DeleteVehicleCall();
}

class GetAllGoodsCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getAllGoods',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/goods',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic rootList(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      );
}

class CreateGoodCall {
  Future<ApiCallResponse> call({
    int? lorrySiteId,
    dynamic goodJson,
  }) async {
    final good = _serializeJson(goodJson);
    final ffApiRequestBody = good;
    return ApiManager.instance.makeApiCall(
      callName: 'createGood',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/goods/$lorrySiteId',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetGoodByIdCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getGoodById',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/goods/$id',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdateGoodCall {
  Future<ApiCallResponse> call({
    int? id,
    dynamic goodJson,
  }) async {
    final good = _serializeJson(goodJson);
    final ffApiRequestBody = good;
    return ApiManager.instance.makeApiCall(
      callName: 'updateGood',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/goods/$id',
      callType: ApiCallType.PUT,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DeleteGoodCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'deleteGood',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/goods/$id',
      callType: ApiCallType.DELETE,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CreateLocationCall {
  Future<ApiCallResponse> call({
    dynamic locationJson,
  }) async {
    final location = _serializeJson(locationJson);
    final ffApiRequestBody = location;
    return ApiManager.instance.makeApiCall(
      callName: 'createLocation',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/locations',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetAllLocationsCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getAllLocations',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/locations',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic rootList(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      );
}

class GetLocationByIdCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getLocationById',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/locations/$id',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdateLocationCall {
  Future<ApiCallResponse> call({
    int? id,
    dynamic locationJson,
  }) async {
    final location = _serializeJson(locationJson);
    final ffApiRequestBody = location;
    return ApiManager.instance.makeApiCall(
      callName: 'updateLocation',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/locations/$id',
      callType: ApiCallType.PUT,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DeleteLocationCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'deleteLocation',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/locations/$id',
      callType: ApiCallType.DELETE,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CreateOrderCall {
  Future<ApiCallResponse> call() async {
    const ffApiRequestBody = '''
{
  "id": 0,
  "shopID": 0,
  "goodIDs": [
    0
  ],
  "transportOperationID": 0
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createOrder',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/orders',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetAllOrdersCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getAllOrders',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/orders',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic rootList(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      );
}

class GetOrderByIdCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getOrderById',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/orders/$id',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdateOrderCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    const ffApiRequestBody = '''
{
  "id": 0,
  "shopID": 0,
  "goodIDs": [
    0
  ],
  "transportOperationID": 0
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'updateOrder',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/orders/$id',
      callType: ApiCallType.PUT,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DeleteOrderCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'deleteOrder',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/orders/$id',
      callType: ApiCallType.DELETE,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CreateShopCall {
  Future<ApiCallResponse> call() async {
    const ffApiRequestBody = '''
{
  "id": 0,
  "name": "",
  "address": "",
  "orderIDs": [
    0
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createShop',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/shops',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetAllShopsCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getAllShops',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/shops',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic rootList(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      );
}

class GetShopByIdCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getShopById',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/shops/$id',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdateShopCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    const ffApiRequestBody = '''
{
  "id": 0,
  "name": "",
  "address": "",
  "orderIDs": [
    0
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'updateShop',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/shops/$id',
      callType: ApiCallType.PUT,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DeleteShopCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'deleteShop',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/shops/$id',
      callType: ApiCallType.DELETE,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CreateTransportOperationCall {
  Future<ApiCallResponse> call() async {
    const ffApiRequestBody = '''
{
  "id": 0,
  "date": "",
  "usedVehicleIDs": [
    0
  ],
  "orderID": 0
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createTransportOperation',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/transport-operations',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetAllTransportOperationsCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getAllTransportOperations',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/transport-operations',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic rootList(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      );
}

class GetTransportOperationByIdCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getTransportOperationById',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/transport-operations/$id',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdateTransportOperationCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    const ffApiRequestBody = '''
{
  "id": 0,
  "date": "",
  "usedVehicleIDs": [
    0
  ],
  "orderID": 0
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'updateTransportOperation',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/transport-operations/$id',
      callType: ApiCallType.PUT,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DeleteTransportOperationCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'deleteTransportOperation',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/transport-operations/$id',
      callType: ApiCallType.DELETE,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CreateVehicleCall {
  Future<ApiCallResponse> call() async {
    const ffApiRequestBody = '''
{
  "id": 0,
  "licensePlate": "",
  "size": 0,
  "maxWeight": 0,
  "lorrySiteID": 0,
  "transportOperationDTOs": [
    {
      "id": 0,
      "date": "",
      "usedVehicleIDs": [
        0
      ],
      "orderID": 0
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createVehicle',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/vehicles',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetAllVehiclesCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getAllVehicles',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/vehicles',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic rootList(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      );
}

class GetVehicleByIdCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getVehicleById',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/vehicles/$id',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdateVehicleCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    const ffApiRequestBody = '''
{
  "id": 0,
  "licensePlate": "",
  "size": 0,
  "maxWeight": 0,
  "lorrySiteID": 0,
  "transportOperationDTOs": [
    {
      "id": 0,
      "date": "",
      "usedVehicleIDs": [
        0
      ],
      "orderID": 0
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'updateVehicle',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/vehicles/$id',
      callType: ApiCallType.PUT,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DeleteVehicleCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'deleteVehicle',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/vehicles/$id',
      callType: ApiCallType.DELETE,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End Haulage Company API Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
