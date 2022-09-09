import 'package:dio/dio.dart';

abstract class ApiConsumer {
  Future<Response> get(String path,{Map<String,dynamic>? queryParameters});
  Future<Response> post(String path,{Map<String,dynamic>? queryParameters,Map<String,dynamic>? body});
  Future<Response> put(String path,{Map<String,dynamic>? queryParameters,Map<String,dynamic>? body});
}