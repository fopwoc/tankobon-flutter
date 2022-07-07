import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:tankobon/api/client/api_exceptions/internal_server_error.dart';
import 'package:tankobon/api/client/api_exceptions/network_error.dart';
import 'package:tankobon/api/client/api_exceptions/unauthorized_error.dart';
import 'package:tankobon/api/client/interceptors/auth_interceptor.dart';
import 'package:tankobon/utils/exceptions.dart';

@LazySingleton()
class ApiClient {
  ApiClient(this.dio) {
    dio.options.baseUrl = 'https://aspirin.moe/tankobon/api/';
    dio.options.connectTimeout = const Duration(seconds: 10).inMilliseconds;
    dio.options.receiveTimeout = const Duration(seconds: 10).inMilliseconds;
    dio.interceptors.add(AuthInterceptor());
  }

  final Dio dio;

  Future<Response> post(
    String path,
    dynamic data,
  ) async {
    print('post');
    try {
      print('post return');
      print('${dio.options.baseUrl}');
      return await dio.post<dynamic>(path, data: data);
    } on NetworkError {
      throw NetworkException();
    } on InternalServerError {
      throw InternalServerException();
    } on UnauthorizedError {
      throw UnauthenticatedException();
    } on DioError {
      throw ApiException();
    }
  }

  Future<Response> put(String path, dynamic data) async {
    try {
      return await dio.put<dynamic>(path, data: data);
    } on NetworkError {
      throw NetworkException();
    } on InternalServerError {
      throw InternalServerException();
    } on UnauthorizedError {
      throw UnauthenticatedException();
    } on DioError {
      throw ApiException();
    }
  }

  Future<Response> delete(String path) async {
    try {
      return await dio.delete<dynamic>(path);
    } on NetworkError {
      throw NetworkException();
    } on InternalServerError {
      throw InternalServerException();
    } on UnauthorizedError {
      throw UnauthenticatedException();
    } on DioError {
      throw ApiException();
    }
  }

  Future<Response> get(String path) async {
    print("get");
    try {
      print("get2");
      return await dio.get<dynamic>(path);
    } on NetworkError {
      throw NetworkException();
    } on InternalServerError {
      throw InternalServerException();
    } on UnauthorizedError {
      throw UnauthenticatedException();
    } on DioError {
      throw ApiException();
    }
  }
}
