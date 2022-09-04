import 'dart:convert';

import 'package:tankobon/api/models/token.dart';
import 'package:tankobon/domain/models/login.dart';
import 'package:tankobon/domain/singletone/http.dart';

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
