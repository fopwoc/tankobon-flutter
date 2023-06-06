import "dart:io";

import "package:freezed_annotation/freezed_annotation.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

part "login_form.freezed.dart";
part "login_form.g.dart";

@freezed
class LoginForm with _$LoginForm {
  const factory LoginForm({
    @Default("") String instance,
    @Default("") String username,
    @Default("") String password,
  }) = _LoginForm;

  const LoginForm._();

  bool get isValid =>
      (Uri.tryParse(instance)?.isAbsolute ?? false) &&
      username.isNotEmpty &&
      password.isNotEmpty;
}

@riverpod
class LoginFormState extends _$LoginFormState {
  @override
  LoginForm build() {
    return LoginForm(
      instance:
          Platform.isAndroid ? "http://10.0.2.2:8080" : "http://127.0.0.1:8080",
      username: "user",
      password: "password",
    );
  }

  void updateInstance(String value) {
    state = state.copyWith(instance: value);
  }

  void updateUsername(String value) {
    state = state.copyWith(username: value);
  }

  void updatePassword(String value) {
    state = state.copyWith(password: value);
  }
}
