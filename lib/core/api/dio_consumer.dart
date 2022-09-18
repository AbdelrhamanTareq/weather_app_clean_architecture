import 'dart:convert';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'api_consumer.dart';
import 'api_constant.dart';
import 'dio_intercepoters.dart';
import 'status_code.dart';
import '../errors/exception.dart';

import '../../injection_container.dart' as di;

class DioConsumer implements ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient dio) {
      dio.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return dio;
    };

    dio.options
      ..baseUrl = ApiConstatnt.baaseUrl
      ..responseType = ResponseType.plain
      ..followRedirects = false
      ..validateStatus = (status) {
        return status! < StatusCode.internalServerError;
      }
      ..queryParameters = {
        "appid": ApiConstatnt.apiId,
        "units": ApiConstatnt.unit
      };

    dio.interceptors.add(di.sl<DioInterceptors>());

    if (kDebugMode) {
      dio.interceptors.add(di.sl<LogInterceptor>());
    }
  }

  @override
  
  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) {
    try {
       
       final response = dio.get(path, queryParameters: queryParameters);
      return response;
      //return _handleResponseAsJson(response);
    } on DioError catch (error) {
      return _handleDioError(error);
    }
   
  }

/*

// todo find why this funtction not working

 Future<Response> get1(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await dio.get(path, queryParameters: queryParameters);
      return _handleResponseAsJson(response);
    } on DioError catch (error) {
     return _handleDioError(error);
    }
  }

  */

  @override
  Future<Response> post(String path,
      {Map<String, dynamic>? body,
      bool formDataIsEnabled = false,
      Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await dio.post(path,
          queryParameters: queryParameters,
          data: formDataIsEnabled ? FormData.fromMap(body!) : body);
      return _handleResponseAsJson(response);
    } on DioError catch (error) {
      return _handleDioError(error);
    }
  }

  @override
  Future<Response> put(String path,
      {Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await dio.put(path, queryParameters: queryParameters, data: body);
      return _handleResponseAsJson(response);
    } on DioError catch (error) {
   return   _handleDioError(error);
    }
  }

  dynamic _handleResponseAsJson(dynamic response) {
    final responseJson = jsonDecode(response.toString());
    return responseJson;
  }

  dynamic _handleDioError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw const FetchDataException();
      case DioErrorType.response:
        switch (error.response?.statusCode) {
          case StatusCode.badRequest:
            throw const BadRequestException();
          case StatusCode.unAuthorized:
          case StatusCode.forbbiden:
            throw const UnauthorizedException();
          case StatusCode.notFound:
            throw const NotFoundException();
          case StatusCode.conflict:
            throw const ConflictException();

          case StatusCode.internalServerError:
            throw const InternalServerErrorException();
        }
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.other:
        throw const NoInternetConnectionException();
    }
  }
}
