import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:tankobon/api/models/exception.dart';
import 'package:tankobon/domain/database/current_instance.dart';
import 'package:tankobon/domain/database/instances.dart';
import 'package:tankobon/domain/exception/type/common.dart';

class HttpProvider {
  static late Client http;

  static Future<void> init() async => http = Client();

  static Future<void> close() async => http.close();
}

Future<Response> getHttp(
  String urn, {
  String? instanceId,
  Map<String, String>? headers,
  String? contentType,
}) async {
  try {
    final instance = await getInstance(
      instanceId ?? await getCurrentInstance(),
    );
    final uri = '${instance.url}$urn';

    if (kDebugMode) {
      print('http GET -> $uri');
    }

    final response = await HttpProvider.http.get(
      Uri.parse(uri),
      headers: <String, String>{
        'Authorization': 'Bearer ${instance.accessToken}',
        'Content-Type': contentType ?? 'application/json',
        ...?headers,
      },
    );

    return _statusException(response);
  } catch (e) {
    rethrow;
  }
}

Future<Response?> postHttp(
  String urn, {
  String? instanceId,
  Map<String, String>? headers,
  String? contentType,
  dynamic requestBody,
}) async {
  try {
    final instance = await getInstance(
      instanceId ?? await getCurrentInstance(),
    );
    final uri = '${instance.url}$urn';

    if (kDebugMode) {
      print('http POST -> $uri');
    }

    final response = await HttpProvider.http.post(
      Uri.parse(uri),
      headers: <String, String>{
        'Authorization': 'Bearer ${instance.accessToken}',
        'Content-Type': contentType ?? 'application/json',
        ...?headers,
      },
      body: requestBody,
    );

    return _statusException(response);
  } catch (e) {
    rethrow;
  }
}

Future<Response> getHttpNoAuth(
  String uri, {
  Map<String, String>? headers,
  String? contentType,
}) async {
  try {
    if (kDebugMode) {
      print('http no auth GET -> $uri');
    }

    final response = await HttpProvider.http.get(
      Uri.parse(uri),
      headers: <String, String>{
        'Content-Type': contentType ?? 'application/json',
        ...?headers,
      },
    );

    return _statusException(response);
  } catch (e) {
    rethrow;
  }
}

Future<Response> postHttpNoAuth(
  String uri, {
  Map<String, String>? headers,
  String? contentType,
  dynamic requestBody,
}) async {
  try {
    if (kDebugMode) {
      print('http no auth POST -> $uri');
    }

    final response = await HttpProvider.http.post(
      Uri.parse(uri),
      headers: <String, String>{
        'Content-Type': contentType ?? 'application/json',
        ...?headers,
      },
      body: requestBody,
    );

    return _statusException(response);
  } catch (e) {
    rethrow;
  }
}

Response _statusException(Response response) {
  if (response.statusCode == 200) {
    return response;
  } else if (response.statusCode == 401) {
    final message = BackendException.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>,
    );
    switch (message.type) {
      case 'token_invalid':
        throw CommonException('token_invalid');
      case 'unauthorized':
        throw CommonException('unauthorized');
      case 'not_admin':
        throw CommonException('not_admin');
      case 'wrong_credentials':
        throw CommonException('wrong_credentials');
      default:
        throw CommonException('401');
    }
  } else if (response.statusCode == 500) {
    final message = BackendException.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>,
    );
    throw CommonException(message.message ?? 'unknown error. Code: 500');
  } else if (response.statusCode == 400) {
    throw CommonException('bad request');
  } else if (response.statusCode == 409) {
    throw CommonException('already exists');
  } else {
    throw CommonException('unknown error. Code: ${response.statusCode}');
  }
}

// response.asStream().listen((http.StreamedResponse r) {
//   r.stream.listen((List<int> chunk) {
//     // Display percentage of completion
//     debugPrint('downloadPercentage: ${downloaded / r.contentLength * 100}');
//
//     chunks.add(chunk);
//     downloaded += chunk.length;
//   }, onDone: () async {
//     // Display percentage of completion
//     debugPrint('downloadPercentage: ${downloaded / r.contentLength * 100}');
//
//     // Save the file
//     File file = new File('$dir/$filename');
//     final Uint8List bytes = Uint8List(r.contentLength);
//     int offset = 0;
//     for (List<int> chunk in chunks) {
//       bytes.setRange(offset, offset + chunk.length, chunk);
//       offset += chunk.length;
//     }
//     await file.writeAsBytes(bytes);
//     return;
//   });
// });
