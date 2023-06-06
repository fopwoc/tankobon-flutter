import "dart:convert";

import "package:tankobon/api/models/token.dart";
import "package:tankobon/domain/database/current_instance.dart";
import "package:tankobon/domain/database/instances.dart";
import "package:tankobon/domain/models/login.dart";
import "package:tankobon/domain/service/http.dart";
import "package:tankobon/domain/state/form/login_form.dart";

Future<Token> login(LoginForm form) async {
  final response = await postHttpNoAuth(
    "${form.instance}/auth/login",
    data: jsonEncode(
      Login(
        username: form.username,
        password: form.password,
      ).toJson(),
    ),
  );

  return Token.fromJson(response.data as Map<String, dynamic>);
}

Future<Token> refresh(String? instanceId) async {
  final instance = await getInstance(
    instanceId ?? await getCurrentInstance(),
  );
  final response = await postHttpNoAuth(
    "${instance.url}/auth/refresh",
    data: jsonEncode({"refreshToken": instance.refreshToken}),
  );

  return Token.fromJson(response.data as Map<String, dynamic>);
}
