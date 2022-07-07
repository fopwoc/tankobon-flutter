import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tankobon/api/models/manga_list.dart';
import 'package:tankobon/api/models/token.dart';
import 'package:tankobon/api/models/user.dart';

Future<void> main() async {
  Future<Response> getURL({required String url, required String token}) async {
    print('dio GET -> $url');

    final options = Options(
      headers: <String, String>{'Authorization': 'Bearer $token'},
      sendTimeout: 3000,
      receiveTimeout: 3000,
    );

    return Dio()
        .get<dynamic>(
      url,
      options: options,
    )
        .onError(
      (error, stackTrace) {
        print('ERROR: $error');
        return null as Response<dynamic>;
      },
    );
  }

  Future<Response> postURL({
    required String url,
    String? token,
    Map<String, String>? requestBody,
    Map<String, String>? headers,
  }) async {
    print('dio POST -> $url');

    final options = Options(
      headers: (headers != null) ? headers : <String, String>{'Authorization': 'Bearer $token'},
      sendTimeout: 3000,
      receiveTimeout: 3000,
    );

    return Dio()
        .post<dynamic>(
      url,
      data: (requestBody != null) ? requestBody : null,
      options: options,
    )
        .onError(
      (error, stackTrace) {
        print('ERROR: $error');
        return null as Response<dynamic>;
      },
    );
  }

  Future<Token> getToken() async {
    final requestBody = <String, String>{
      'username': 'aspirin',
      'password': 'password',
    };
    return postURL(
      url: 'https://aspirin.moe/tankobon/api/login',
      headers: <String, String>{'Content-Type': 'application/json'},
      requestBody: requestBody,
    ).then((value) => Token.fromJson(value.data as Map<String, dynamic>)).onError(
      (error, stackTrace) {
        print('ERROR: $error');
        return null as Token;
      },
    );
  }

  late String token;

  setUp(() async {
    final tokenData = await getToken();
    print(tokenData.token);
    token = tokenData.token;
  });

  test('current user', () async {
    final currentContent = await getURL(
      url: 'https://aspirin.moe/tankobon/api/me',
      token: token,
    );

    final jsonContent = currentContent.data as Map<String, dynamic>;
    print(jsonContent);

    final result = User.fromJson(jsonContent);
    print('\nresult: ${result.toJson()}');

    expect(result.runtimeType, User);
  });

  test('manga list', () async {
    final currentContent = await getURL(
      url: 'https://aspirin.moe/tankobon/api/list',
      token: token,
    );

    final jsonContent = currentContent.data as List<dynamic>;
    print('result length: ${jsonContent.length}');

    final locationList = <MangaListItem>[];

    for (final item in jsonContent) {
      print(jsonContent.indexOf(item));

      final result = MangaListItem.fromJson(item as Map<String, dynamic>);
      print('\nresult: ${result.toJson()}');

      locationList.add(result);
    }

    expect(locationList.length, jsonContent.length);
  });
}
