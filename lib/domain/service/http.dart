import "dart:async";

import "package:dio/dio.dart";
import "package:tankobon/api/models/exception.dart";
import "package:tankobon/domain/database/current_instance.dart";
import "package:tankobon/domain/database/instances.dart";
import "package:tankobon/domain/exception/model/common_exception.dart";
import "package:tankobon/domain/provider/dio_provider.dart";
import "package:tankobon/domain/provider/logger_provider.dart";

enum HttpMethod {
  get("GET"),
  post("POST");

  const HttpMethod(this.value);
  final String value;
}

Future<Response<T>> getHttp<T>(
  String urn, {
  String? instanceId,
  Map<String, String>? headers,
  String? contentType,
  ResponseType? responseType,
  ProgressCallback? onReceiveProgress,
}) async {
  final instance = await getInstance(
    instanceId ?? await getCurrentInstance(),
  );

  return _request<T>(
    HttpMethod.get,
    Uri.parse("${instance.url}$urn"),
    headers: <String, String>{
      "Authorization": "Bearer ${instance.accessToken}",
      ...?headers,
    },
    contentType: contentType,
    responseType: responseType,
    onReceiveProgress: onReceiveProgress,
  );
}

Future<Response<T>> postHttp<T>(
  String urn, {
  String? instanceId,
  Map<String, String>? headers,
  String? contentType,
  ResponseType? responseType,
  dynamic data,
  ProgressCallback? onSendProgress,
  ProgressCallback? onReceiveProgress,
}) async {
  final instance = await getInstance(
    instanceId ?? await getCurrentInstance(),
  );

  return _request<T>(
    HttpMethod.post,
    Uri.parse("${instance.url}$urn"),
    headers: <String, String>{
      "Authorization": "Bearer ${instance.accessToken}",
      ...?headers,
    },
    contentType: contentType,
    responseType: responseType,
    data: data,
    onSendProgress: onSendProgress,
    onReceiveProgress: onReceiveProgress,
  );
}

Future<Response<T>> getHttpNoAuth<T>(
  String uri, {
  Map<String, String>? headers,
  String? contentType,
  ResponseType? responseType,
  ProgressCallback? onReceiveProgress,
}) =>
    _request<T>(
      HttpMethod.get,
      Uri.parse(uri),
      headers: <String, String>{
        ...?headers,
      },
      contentType: contentType,
      responseType: responseType,
      onReceiveProgress: onReceiveProgress,
    );

Future<Response<T>> postHttpNoAuth<T>(
  String uri, {
  Map<String, String>? headers,
  String? contentType,
  ResponseType? responseType,
  dynamic data,
  ProgressCallback? onSendProgress,
  ProgressCallback? onReceiveProgress,
}) =>
    _request<T>(
      HttpMethod.post,
      Uri.parse(uri),
      headers: <String, String>{
        ...?headers,
      },
      contentType: contentType,
      responseType: responseType,
      data: data,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

Future<Response<T>> _request<T>(
  HttpMethod method,
  Uri uri, {
  Map<String, String>? headers,
  String? contentType,
  ResponseType? responseType,
  dynamic data,
  ProgressCallback? onSendProgress,
  ProgressCallback? onReceiveProgress,
}) async {
  LoggerProvider.fine("http ${method.value} -> $uri");

  final options = Options(
    headers: headers,
    contentType: contentType ?? "application/json",
    responseType: responseType ?? ResponseType.json,
  );

  return _statusException<T>(
    switch (method) {
      HttpMethod.get => await DioProvider.dio.getUri<T>(
          uri,
          options: options,
          data: data,
          onReceiveProgress: onReceiveProgress,
        ),
      HttpMethod.post => await DioProvider.dio.postUri<T>(
          uri,
          options: options,
          data: data,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress,
        ),
    },
  );
}

Future<Response<T>> _statusException<T>(
  Response<T> response, {
  dynamic requestBody,
}) async {
  if (response.statusCode == 200) {
    return response;
  } else if (response.statusCode == 403) {
    final message = BackendException.fromJson(
      response.data as Map<String, dynamic>,
    );
    switch (message.type) {
      case "not_admin":
        throw CommonException("not_admin");
      case "wrong_credentials":
        throw CommonException("wrong_credentials");
      default:
        throw CommonException("unknown error. Code: 403");
    }
  } else if (response.statusCode == 500) {
    final message = BackendException.fromJson(
      response.data as Map<String, dynamic>,
    );
    throw CommonException(message.message ?? "unknown error. Code: 500");
  } else if (response.statusCode == 400) {
    throw CommonException("bad request");
  } else if (response.statusCode == 401) {
    throw CommonException("unauthorized");
  } else if (response.statusCode == 409) {
    throw CommonException("already exists");
  } else {
    throw CommonException("unknown error. Code: ${response.statusCode}");
  }
}
