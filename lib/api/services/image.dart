import "dart:typed_data";

import "package:dio/dio.dart";
import "package:tankobon/domain/service/http.dart";

enum ImageType {
  fullSize("manga"),
  thumbnail("thumbnail");

  const ImageType(this.value);
  final String value;
}

Future<Uint8List> getImage(
  String path, {
  ImageType type = ImageType.fullSize,
  ProgressCallback? onReceiveProgress,
}) async {
  final response = await getHttp<Uint8List>(
    "/content/${type.value}/$path",
    contentType: "image/jpeg",
    responseType: ResponseType.bytes,
    onReceiveProgress: onReceiveProgress,
  );

  return response.data!;
}

Future<Uint8List> getRawImage(
  String uri, {
  ProgressCallback? onReceiveProgress,
}) async {
  final response = await getHttpNoAuth<Uint8List>(
    uri,
    contentType: "image/jpeg",
    responseType: ResponseType.bytes,
    onReceiveProgress: onReceiveProgress,
  );

  return response.data!;
}
