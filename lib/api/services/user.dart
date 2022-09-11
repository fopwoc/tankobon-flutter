import 'dart:convert';

import 'package:tankobon/api/models/user.dart';
import 'package:tankobon/domain/service/http.dart';

Future<User> getMe() async {
  final response = await getHttp('/users/me');

  return User.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
}
