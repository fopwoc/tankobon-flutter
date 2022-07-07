import 'package:dio/dio.dart';
import 'package:tankobon/api/client/api_exceptions/internal_server_error.dart';

class InternalServerErrorInterceptor extends Interceptor {
  @override
  Future onError(DioError _dioError, ErrorInterceptorHandler handler) async {
    if (_dioError.response != null) {
      if (_dioError.response!.statusCode != null &&
          _dioError.response!.statusCode! >= 500 &&
          _dioError.response!.statusCode! < 600) {
        return InternalServerError(
          dioError: _dioError,
        );
      }
    }

    return null;
  }
}
