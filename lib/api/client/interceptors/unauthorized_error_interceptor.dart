import 'package:dio/dio.dart';
import 'package:tankobon/api/client/api_exceptions/unauthorized_error.dart';

class UnauthorizedErrorInterceptor extends Interceptor {
  @override
  Future onError(DioError error, ErrorInterceptorHandler handler) async {
    if (error.response?.statusCode == 401 || error.response?.statusCode == 403) {
      return UnauthorizedError(dioError: error);
    }

    return null;
  }
}
