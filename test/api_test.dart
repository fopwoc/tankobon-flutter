import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:tankobon/api/dio_client.dart';
import 'package:tankobon/api/models/manga.dart';
import 'package:tankobon/api/models/token.dart';
import 'package:tankobon/api/models/user.dart';

String _jsonPrint(dynamic json) {
  const encoder = JsonEncoder.withIndent('  ');
  final prettyprint = encoder.convert(json);
  return prettyprint;
}

const url = 'http://localhost:8080';
const user = 'user';
const pass = 'password';

Future<void> main() async {
  Future<Token> getToken() async {
    final payload = <String, String>{
      'username': user,
      'password': pass,
    };

    final currentContent = await postURL(
      url: '$url/login',
      requestBody: payload,
    );

    final jsonContent = currentContent?.data as Map<String, dynamic>;

    final result = Token.fromJson(jsonContent);
    return result;
  }

  late String token;

  setUp(() async {
    final tokenData = await getToken();
    print(tokenData.accessToken);
    token = tokenData.accessToken;
  });

  test('current user', () async {
    final currentContent = await getURL(
      url: '$url/me',
      token: token,
    );

    final jsonContent = currentContent.data as Map<String, dynamic>;
    print(_jsonPrint(jsonContent));

    final result = User.fromJson(jsonContent);
    print('\nresult: ${result.runtimeType} ${result.toJson()}');

    expect(result, isA<User>());
  });

  test('manga list', () async {
    final currentContent = await getURL(
      url: 'http://localhost:8080/list',
      token: token,
    );

    final jsonContent = currentContent.data as List<dynamic>;
    print('result length: ${jsonContent.length}');

    final mangaList = <Manga>[];

    for (final item in jsonContent) {
      print(_jsonPrint(jsonContent.indexOf(item)));
      print('item index: $item');

      final result = Manga.fromJson(item as Map<String, dynamic>);
      print('\nresult: ${result.runtimeType} ${result.toJson()}');

      mangaList.add(result);
    }

    expect(mangaList.length, jsonContent.length);
  });
}
