import 'package:freezed_annotation/freezed_annotation.dart';

part 'login.freezed.dart';
part 'login.g.dart';

@freezed
class LoginForm with _$LoginForm {
  const factory LoginForm({
    required String instance,
    required String username,
    required String password,
  }) = _LoginForm;
}

@freezed
class Login with _$Login {
  const factory Login({
    required String username,
    required String password,
  }) = _Login;

  factory Login.fromJson(Map<String, Object?> json) => _$LoginFromJson(json);
}
