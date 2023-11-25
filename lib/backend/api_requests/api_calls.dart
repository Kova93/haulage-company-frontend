import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Haulage Company API Group Code

class HaulageCompanyAPIGroup {
  static String baseUrl = '/api';
  static Map<String, String> headers = {};
  static RegisterANewUserCall registerANewUserCall = RegisterANewUserCall();
  static LogInAUserCall logInAUserCall = LogInAUserCall();
  static CheckIfAUsernameExistsCall checkIfAUsernameExistsCall =
      CheckIfAUsernameExistsCall();
  static GetAllUsersCall getAllUsersCall = GetAllUsersCall();
  static GetUserByIDCall getUserByIDCall = GetUserByIDCall();
  static DeleteUserByIDCall deleteUserByIDCall = DeleteUserByIDCall();
  static UpdateUserRolesByIDCall updateUserRolesByIDCall =
      UpdateUserRolesByIDCall();
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

class RegisterANewUserCall {
  Future<ApiCallResponse> call() async {
    const ffApiRequestBody = '''
{
  "name": "",
  "username": "",
  "password": "",
  "role": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Register a new user',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/users/register',
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

class LogInAUserCall {
  Future<ApiCallResponse> call({
    dynamic loginJsonJson,
  }) async {
    final loginJson = _serializeJson(loginJsonJson);
    final ffApiRequestBody = loginJson;
    return ApiManager.instance.makeApiCall(
      callName: 'Log in a user',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/users/login',
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

class CheckIfAUsernameExistsCall {
  Future<ApiCallResponse> call({
    String? name = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Check if a username exists',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/users/checkName/$name',
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

class GetAllUsersCall {
  Future<ApiCallResponse> call({
    String? bearerAuth = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get all users',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/users/all',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $bearerAuth',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetUserByIDCall {
  Future<ApiCallResponse> call({
    int? id,
    String? bearerAuth = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get user by ID',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/users/$id',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $bearerAuth',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DeleteUserByIDCall {
  Future<ApiCallResponse> call({
    int? id,
    String? bearerAuth = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Delete user by ID',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/users/$id',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Bearer $bearerAuth',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdateUserRolesByIDCall {
  Future<ApiCallResponse> call({
    int? id,
    String? bearerAuth = '',
  }) async {
    const ffApiRequestBody = '''
[
  ""
]''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update user roles by ID',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/users/$id',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer $bearerAuth',
      },
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

class GetAllGoodsCall {
  Future<ApiCallResponse> call({
    String? bearerAuth = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getAllGoods',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/goods',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $bearerAuth',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic rootList(dynamic response) => getJsonField(
        response,
        r'''$[*]''',
        true,
      );
}

class CreateGoodCall {
  Future<ApiCallResponse> call({
    int? lorrySiteId,
    String? bearerAuth = '',
    dynamic goodJsonJson,
  }) async {
    final goodJson = _serializeJson(goodJsonJson);
    final ffApiRequestBody = goodJson;
    return ApiManager.instance.makeApiCall(
      callName: 'createGood',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/goods/$lorrySiteId',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $bearerAuth',
      },
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
    String? bearerAuth = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getGoodById',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/goods/$id',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $bearerAuth',
      },
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
    String? bearerAuth = '',
    dynamic goodJsonJson,
  }) async {
    final goodJson = _serializeJson(goodJsonJson);
    final ffApiRequestBody = goodJson;
    return ApiManager.instance.makeApiCall(
      callName: 'updateGood',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/goods/$id',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer $bearerAuth',
      },
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
    String? bearerAuth = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'deleteGood',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/goods/$id',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Bearer $bearerAuth',
      },
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
    String? bearerAuth = '',
    dynamic locationJsonJson,
  }) async {
    final locationJson = _serializeJson(locationJsonJson);
    final ffApiRequestBody = locationJson;
    return ApiManager.instance.makeApiCall(
      callName: 'createLocation',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/locations',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $bearerAuth',
      },
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
  Future<ApiCallResponse> call({
    String? bearerAuth = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getAllLocations',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/locations',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $bearerAuth',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic rootList(dynamic response) => getJsonField(
        response,
        r'''$[*]''',
        true,
      );
}

class GetLocationByIdCall {
  Future<ApiCallResponse> call({
    int? id,
    String? bearerAuth = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getLocationById',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/locations/$id',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $bearerAuth',
      },
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
    String? bearerAuth = '',
    dynamic locationJsonJson,
  }) async {
    final locationJson = _serializeJson(locationJsonJson);
    final ffApiRequestBody = locationJson;
    return ApiManager.instance.makeApiCall(
      callName: 'updateLocation',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/locations/$id',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer $bearerAuth',
      },
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
    String? bearerAuth = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'deleteLocation',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/locations/$id',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Bearer $bearerAuth',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CreateOrderCall {
  Future<ApiCallResponse> call({
    String? bearerAuth = '',
    dynamic orderJsonJson,
  }) async {
    final orderJson = _serializeJson(orderJsonJson);
    final ffApiRequestBody = orderJson;
    return ApiManager.instance.makeApiCall(
      callName: 'createOrder',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/orders',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $bearerAuth',
      },
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
  Future<ApiCallResponse> call({
    String? bearerAuth = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getAllOrders',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/orders',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $bearerAuth',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic rootList(dynamic response) => getJsonField(
        response,
        r'''$[*]''',
        true,
      );
}

class GetOrderByIdCall {
  Future<ApiCallResponse> call({
    int? id,
    String? bearerAuth = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getOrderById',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/orders/$id',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $bearerAuth',
      },
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
    String? bearerAuth = '',
    dynamic orderJsonJson,
  }) async {
    final orderJson = _serializeJson(orderJsonJson);
    final ffApiRequestBody = orderJson;
    return ApiManager.instance.makeApiCall(
      callName: 'updateOrder',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/orders/$id',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer $bearerAuth',
      },
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
    String? bearerAuth = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'deleteOrder',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/orders/$id',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Bearer $bearerAuth',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CreateShopCall {
  Future<ApiCallResponse> call({
    String? bearerAuth = '',
    dynamic shopJsonJson,
  }) async {
    final shopJson = _serializeJson(shopJsonJson);
    final ffApiRequestBody = shopJson;
    return ApiManager.instance.makeApiCall(
      callName: 'createShop',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/shops',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $bearerAuth',
      },
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
  Future<ApiCallResponse> call({
    String? bearerAuth = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getAllShops',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/shops',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $bearerAuth',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic rootList(dynamic response) => getJsonField(
        response,
        r'''$[*]''',
        true,
      );
}

class GetShopByIdCall {
  Future<ApiCallResponse> call({
    int? id,
    String? bearerAuth = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getShopById',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/shops/$id',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $bearerAuth',
      },
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
    String? bearerAuth = '',
    dynamic shopJsonJson,
  }) async {
    final shopJson = _serializeJson(shopJsonJson);
    final ffApiRequestBody = shopJson;
    return ApiManager.instance.makeApiCall(
      callName: 'updateShop',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/shops/$id',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer $bearerAuth',
      },
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
    String? bearerAuth = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'deleteShop',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/shops/$id',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Bearer $bearerAuth',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CreateTransportOperationCall {
  Future<ApiCallResponse> call({
    String? bearerAuth = '',
    dynamic transportJsonJson,
  }) async {
    final transportJson = _serializeJson(transportJsonJson);
    final ffApiRequestBody = transportJson;
    return ApiManager.instance.makeApiCall(
      callName: 'createTransportOperation',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/transport-operations',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $bearerAuth',
      },
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
  Future<ApiCallResponse> call({
    String? bearerAuth = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getAllTransportOperations',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/transport-operations',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $bearerAuth',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic rootList(dynamic response) => getJsonField(
        response,
        r'''$[*]''',
        true,
      );
}

class GetTransportOperationByIdCall {
  Future<ApiCallResponse> call({
    int? id,
    String? bearerAuth = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getTransportOperationById',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/transport-operations/$id',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $bearerAuth',
      },
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
    String? bearerAuth = '',
    dynamic transportJsonJson,
  }) async {
    final transportJson = _serializeJson(transportJsonJson);
    final ffApiRequestBody = transportJson;
    return ApiManager.instance.makeApiCall(
      callName: 'updateTransportOperation',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/transport-operations/$id',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer $bearerAuth',
      },
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
    String? bearerAuth = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'deleteTransportOperation',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/transport-operations/$id',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Bearer $bearerAuth',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CreateVehicleCall {
  Future<ApiCallResponse> call({
    String? bearerAuth = '',
    dynamic vehicleJsonJson,
  }) async {
    final vehicleJson = _serializeJson(vehicleJsonJson);
    final ffApiRequestBody = vehicleJson;
    return ApiManager.instance.makeApiCall(
      callName: 'createVehicle',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/vehicles',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $bearerAuth',
      },
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
  Future<ApiCallResponse> call({
    String? bearerAuth = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getAllVehicles',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/vehicles',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $bearerAuth',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic rootList(dynamic response) => getJsonField(
        response,
        r'''$[*]''',
        true,
      );
}

class GetVehicleByIdCall {
  Future<ApiCallResponse> call({
    int? id,
    String? bearerAuth = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getVehicleById',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/vehicles/$id',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $bearerAuth',
      },
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
    String? bearerAuth = '',
    dynamic vehicleJsonJson,
  }) async {
    final vehicleJson = _serializeJson(vehicleJsonJson);
    final ffApiRequestBody = vehicleJson;
    return ApiManager.instance.makeApiCall(
      callName: 'updateVehicle',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/vehicles/$id',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer $bearerAuth',
      },
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
    String? bearerAuth = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'deleteVehicle',
      apiUrl: '${HaulageCompanyAPIGroup.baseUrl}/vehicles/$id',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Bearer $bearerAuth',
      },
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
