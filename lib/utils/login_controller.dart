import 'package:data_channel/data_channel.dart';
import 'package:injectable/injectable.dart';
import 'package:tankobon/api/models/token.dart';
import 'package:tankobon/models/login_request.dart';
import 'package:tankobon/utils/login_repository.dart';

@LazySingleton()
class LoginController {
  LoginController(this._loginRepository);

  final LoginRepository _loginRepository;

  Future<DC<Exception, Token>> postLogin(
    LoginRequest params,
  ) async {
    final _postLoginData = await _loginRepository.postLogin(params);

    if (_postLoginData.hasError) {
      return DC.error(
        _postLoginData.error!,
      );
    }

    return DC.data(
      _postLoginData.data,
    );
  }

  Future<DC<Exception, Token?>> getAuthenticationData() async {
    return _loginRepository.getToken();
  }
}
