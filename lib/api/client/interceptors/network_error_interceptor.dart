import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:tankobon/api/client/api_exceptions/network_error.dart';

class NetworkErrorInterceptor extends Interceptor {
  final Connectivity _connectivity = Connectivity();

  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    return options;
  }

  @override
  Future onError(DioError error, ErrorInterceptorHandler handler) async {
    final _connectivityStatus = _connectivity.checkConnectivity();
    if (error.response == null && await _connectivityStatus == ConnectivityResult.none) {
      return NetworkError(dioError: error);
    }

    return null;
  }
}
