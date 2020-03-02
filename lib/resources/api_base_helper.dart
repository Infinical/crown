import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:new_crown/models/user.dart';
import './api.dart' as api;
import 'package:dio/dio.dart' as dio;

class ApiBaseHelper {
  Dio _dio = new Dio();
  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      final response = await _dio.get(api.url + url);
      responseJson = _returnResponse(response);
    } on DioError {
      throw DioErrorType.CONNECT_TIMEOUT;
    }
    return responseJson;
  }

  Future<dynamic> post(String url, Object body) async {
    var responseJson;
    try {
      final response = await _dio.post(api.url + url, data: {});
      responseJson = _returnResponse(response);
    } on DioError {
      throw DioErrorType.CONNECT_TIMEOUT;
    }
    return responseJson;
  }
}

dynamic _returnResponse(dio.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = json.decode(response.data.toString());
      print(responseJson);
      return responseJson;
      break;

    case 400:
      throw BadRequestException(response.data.toString());
    case 401:
    case 403:
      throw UnauthorisedException(response.data.toString());
    case 500:
    default:
      throw FetchDataException('Error occured while communicating with server');
  }
}
