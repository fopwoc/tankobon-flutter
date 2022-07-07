import 'package:data_channel/data_channel.dart';
import 'package:injectable/injectable.dart';
import 'package:tankobon/api/client/api_client.dart';
import 'package:tankobon/api/models/token.dart';
import 'package:tankobon/models/login_request.dart';

@LazySingleton()
class ApiLogin {
  ApiLogin(this._apiClient);

  final ApiClient _apiClient;

  Future<DC<Exception, Token>> postLogin(
    LoginRequest params,
  ) async {
    try {
      print('postlogin');
      final response = await _apiClient.post(
        'login',
        params,
      );

      print('return token $response');
      return DC.data(
        Token.fromJson(response.data as Map<String, dynamic>),
      );
    } on Exception catch (e) {
      return DC.error(
        e,
      );
    }
  }
}
