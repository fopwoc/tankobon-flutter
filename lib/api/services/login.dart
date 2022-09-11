import 'dart:convert';

import 'package:tankobon/api/models/token.dart';
import 'package:tankobon/domain/database/current_instance.dart';
import 'package:tankobon/domain/database/instances.dart';
import 'package:tankobon/domain/models/login.dart';
import 'package:tankobon/domain/service/http.dart';

Future<Token> login(LoginPayload form) async {
  final response = await postHttpNoAuth(
    '${form.instance}/login',
    requestBody: jsonEncode(
      Login(
        username: form.username,
        password: form.password,
      ).toJson(),
    ),
  );

  return Token.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
}

Future<Token> refresh(String? instanceId) async {
  final instance = await getInstance(
    instanceId ?? await getCurrentInstance(),
  );
  final response = await postHttpNoAuth(
    '${instance.url}/refresh',
    requestBody: jsonEncode({'refreshToken': instance.refreshToken}),
  );

  return Token.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
}
