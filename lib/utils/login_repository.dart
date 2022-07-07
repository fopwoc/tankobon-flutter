import 'package:data_channel/data_channel.dart';
import 'package:injectable/injectable.dart';
import 'package:tankobon/api/models/token.dart';
import 'package:tankobon/data/shared_preference.dart';
import 'package:tankobon/models/login_request.dart';
import 'package:tankobon/utils/login.dart';

@LazySingleton()
class LoginRepository {
  LoginRepository(
    this._loginLocalDataSource,
    this._localSharedPreference,
  );

  final ApiLogin _loginLocalDataSource;
  final LocalSharedPreference _localSharedPreference;

  Future<DC<Exception, Token>> postLogin(
    LoginRequest params,
  ) async {
    return _loginLocalDataSource.postLogin(params);
  }

  Future<DC<Exception, Token?>> getToken() async {
    return _localSharedPreference.getToken();
  }
}
