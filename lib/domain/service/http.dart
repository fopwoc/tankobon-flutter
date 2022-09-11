import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:tankobon/api/models/exception.dart';
import 'package:tankobon/domain/database/current_instance.dart';
import 'package:tankobon/domain/database/instances.dart';
import 'package:tankobon/domain/exception/type/common.dart';
import 'package:tankobon/domain/service/refresh_token.dart';
import 'package:tankobon/domain/singleton/http.dart';

Future<Response> getHttp(
  String urn, {
  String? instanceId,
  Map<String, String>? headers,
  String? contentType,
}) async {
  final instance = await getInstance(
    instanceId ?? await getCurrentInstance(),
  );

  return _statusException(
    await _get(
      Uri.parse('${instance.url}$urn'),
      headers: <String, String>{
        'Authorization': 'Bearer ${instance.accessToken}',
        'Content-Type': contentType ?? 'application/json',
        ...?headers,
      },
    ),
  );
}

Future<Response> postHttp(
  String urn, {
  String? instanceId,
  Map<String, String>? headers,
  String? contentType,
  dynamic requestBody,
}) async {
  final instance = await getInstance(
    instanceId ?? await getCurrentInstance(),
  );

  return _statusException(
    await _post(
      Uri.parse('${instance.url}$urn'),
      headers: <String, String>{
        'Authorization': 'Bearer ${instance.accessToken}',
        'Content-Type': contentType ?? 'application/json',
        ...?headers,
      },
      requestBody: requestBody,
      refresh: true,
    ),
    requestBody: requestBody,
  );
}

Future<Response> getHttpNoAuth(
  String uri, {
  Map<String, String>? headers,
  String? contentType,
}) async {
  return _statusException(
    await _get(
      Uri.parse(uri),
      headers: <String, String>{
        'Content-Type': contentType ?? 'application/json',
        ...?headers,
      },
    ),
  );
}

Future<Response> postHttpNoAuth(
  String uri, {
  Map<String, String>? headers,
  String? contentType,
  dynamic requestBody,
}) async {
  return _statusException(
    await _post(
      Uri.parse(uri),
      headers: <String, String>{
        'Content-Type': contentType ?? 'application/json',
        ...?headers,
      },
      requestBody: requestBody,
    ),
    requestBody: requestBody,
  );
}

Future<Response> _get(
  Uri uri, {
  Map<String, String>? headers,
}) async {
  try {
    if (kDebugMode) {
      print('http GET -> $uri');
    }

    final response = await HttpProvider.http.get(
      uri,
      headers: headers,
    );

    return response;
  } catch (e) {
    rethrow;
  }
}

Future<Response> _post(
  Uri uri, {
  Map<String, String>? headers,
  dynamic requestBody,
  bool refresh = false,
}) async {
  try {
    if (kDebugMode) {
      print('http POST -> $uri');
    }

    final response = await HttpProvider.http.post(
      uri,
      headers: headers,
      body: requestBody,
    );

    return response;
  } catch (e) {
    rethrow;
  }
}

Future<Response> _statusException(
  Response response, {
  dynamic requestBody,
}) async {
  if (response.statusCode == 200) {
    return response;
  } else if (response.statusCode == 403) {
    final message = BackendException.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>,
    );
    switch (message.type) {
      case 'not_admin':
        throw CommonException('not_admin');
      case 'wrong_credentials':
        throw CommonException('wrong_credentials');
      default:
        throw CommonException('unknown error. Code: 403');
    }
  } else if (response.statusCode == 500) {
    final message = BackendException.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>,
    );
    throw CommonException(message.message ?? 'unknown error. Code: 500');
  } else if (response.statusCode == 400) {
    throw CommonException('bad request');
  } else if (response.statusCode == 401) {
    final newResponse = await _refresh(response);
    if (newResponse.statusCode == 200) {
      return newResponse;
    } else if (response.statusCode == 401) {
      throw CommonException('unauthorized');
    } else {
      return _statusException(newResponse);
    }
  } else if (response.statusCode == 409) {
    throw CommonException('already exists');
  } else {
    throw CommonException('unknown error. Code: ${response.statusCode}');
  }
}

Future<Response> _refresh(Response response, {dynamic requestBody}) async {
  if (response.request != null &&
      response.request?.headers['Authorization'] != null) {
    final newToken = await refreshToken();
    final newHeaders = response.request!.headers;
    newHeaders['Authorization'] = 'Bearer $newToken';

    switch (response.request?.method) {
      case 'GET':
        return _get(
          response.request!.url,
          headers: newHeaders,
        );
      case 'POST':
        return _post(
          response.request!.url,
          headers: newHeaders,
          requestBody: requestBody,
        );
      default:
        throw CommonException('unknown method');
    }
  } else {
    return response;
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
