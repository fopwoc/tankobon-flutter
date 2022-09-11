import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:tankobon/api/models/manga.dart';
import 'package:tankobon/api/models/user.dart';
import 'package:tankobon/api/services/login.dart';
import 'package:tankobon/api/services/manga.dart';
import 'package:tankobon/api/services/user.dart';
import 'package:tankobon/domain/database/current_instance.dart';
import 'package:tankobon/domain/database/instances.dart';
import 'package:tankobon/domain/models/login.dart';
import 'package:tankobon/domain/singleton/http.dart';
import 'package:tankobon/domain/singleton/isar.dart';

String _jsonPrint(dynamic json) {
  const encoder = JsonEncoder.withIndent('  ');
  final prettyprint = encoder.convert(json);
  return prettyprint;
}

const url = 'http://localhost:8080';
const user = 'user';
const pass = 'password';

Future<void> main() async {
  await Isar.initializeIsarCore(download: true);
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    HttpOverrides.global = null;

    await HttpProvider.init();
    await IsarProvider.init();

    final token = await login(
      const LoginPayload(
        instance: url,
        username: user,
        password: pass,
      ),
    );
    await addInstance(token, url);
    await setCurrentInstance(token.instanceId);
  });

  tearDownAll(() async {
    await IsarProvider.clear();
    await IsarProvider.close();
  });

  test('current user', () async {
    final result = await getMe();

    if (kDebugMode) {
      print(_jsonPrint(result.toJson()));
    }
    expect(result, isA<User>());
  });

  test('manga list', () async {
    final result = await getMangaList();

    for (final e in result) {
      if (kDebugMode) {
        print(_jsonPrint(e.toJson()));
      }
    }
    expect(result, isA<List<Manga>>());
  });
}
