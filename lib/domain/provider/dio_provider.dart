import "package:dio/dio.dart";
import "package:jwt_decoder/jwt_decoder.dart";
import "package:tankobon/domain/service/refresh_token.dart";
import "package:tankobon/util/regex_token.dart";

class DioProvider {
  DioProvider._();

  static late Dio dio;

  static void init() {
    dio = Dio()
      ..options.connectTimeout = const Duration(seconds: 30)
      ..options.receiveTimeout = const Duration(seconds: 30)
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) async {
            if (options.headers.containsKey("Authorization")) {
              if (JwtDecoder.isExpired(
                regexToken(options.headers["Authorization"] as String),
              )) {
                final newToken = await refreshToken();
                options.headers["Authorization"] = "Bearer $newToken";
              }
            }

            handler.next(options);
          },
          onError: (err, handler) {
            handler.reject(err);
          },
        ),
      );
  }

  static void close() => dio.close();
}
