import 'package:flutter/material.dart';
import 'package:tankobon/api/dio_client.dart';
import 'package:tankobon/api/models/token.dart';
import 'package:tankobon/domain/models/login.dart';

Future<Token> login(LoginForm form) async {
  final response = await postURL(
    url: '${form.instance}/login',
    requestBody: Login(
      username: form.username,
      password: form.password,
    ).toJson(),
  ).onError((error, stackTrace) => throw FlutterError('$error'));

  return Token.fromJson(response?.data as Map<String, dynamic>);
}

// Future<Token> list() async {
//   final response = await getURL(
//     url: '${form.instance}/login',
//     token: '',
//   ).onError((error, stackTrace) => throw FlutterError('$error'));
//
//   return Token.fromJson(response?.data as Map<String, dynamic>);
// }
