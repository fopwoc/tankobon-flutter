import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tankobon/data/shared_preference.dart';

class AuthInterceptor extends Interceptor {
  @override
  Future<RequestOptions> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final _localSharedPreference = LocalSharedPreference(await SharedPreferences.getInstance());
    final _authData = await _localSharedPreference.getToken();

    if (!_authData.hasError && _authData.hasData) {
      options.headers['Authorization'] = 'Bearer ${_authData.data!.token}';
    }

    return options;
  }
}
