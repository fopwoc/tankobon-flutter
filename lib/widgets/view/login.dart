import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tankobon/api/client/api_client.dart';
import 'package:tankobon/api/models/token.dart';
import 'package:tankobon/models/login_request.dart';
import 'package:tankobon/utils/login.dart';

class LoginView extends HookWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final urlController = TextEditingController();
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(14),
      child: Center(
        child: Wrap(
          runSpacing: 20,
          children: [
            Wrap(
              runSpacing: 10,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    ApiLogin(ApiClient(Dio()))
                        .postLogin(LoginRequest(username: 'aspirin', password: 'password'))
                        .then((value) => print(value.data?.token ?? 'bruh'));
                  },
                  child: const Text('Disabled'),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () async {
                    final tokenData = await getToken();
                    print(tokenData.token);
                  },
                  child: const Text('2'),
                ),
                // CupertinoTextField(
                //   controller: urlController,
                //   keyboardType: const TextInputType.numberWithOptions(decimal: true),
                //   placeholder: 'https://example.com/',
                // ),
                // CupertinoTextField(
                //   controller: usernameController,
                //   keyboardType: const TextInputType.numberWithOptions(decimal: true),
                //   placeholder: 'username',
                // ),
                // CupertinoTextField(
                //   controller: passwordController,
                //   keyboardType: const TextInputType.numberWithOptions(decimal: true),
                //   placeholder: 'password',
                // ),
              ],
            ),
            // CupertinoButton(
            //   child: const Text('Login'),
            //   onPressed: () {},
            // ),
          ],
        ),
      ),
    );
  }
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
