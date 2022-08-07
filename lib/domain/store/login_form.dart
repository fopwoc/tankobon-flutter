import 'dart:io';

import 'package:mobx/mobx.dart';

part 'login_form.g.dart';

class LoginFormStore = _LoginFormStore with _$LoginFormStore;

abstract class _LoginFormStore with Store {
  @observable
  String instance =
      Platform.isAndroid ? 'http://10.0.2.2:8080' : 'http://127.0.0.1:8080';

  @observable
  String username = 'user';

  @observable
  String password = 'password';
}
