import 'dart:typed_data';

import 'package:tankobon/domain/service/http.dart';

Future<Uint8List> getImage(String mangaId, int volume, int chapter) async {
  final response = await getHttp('/manga/$mangaId/$volume/$chapter');
  return response.bodyBytes;
}

Future<Uint8List> getImageThumb(String mangaId, int volume, int chapter) async {
  final response = await getHttp('/thumb/$mangaId/$volume/$chapter');
  return response.bodyBytes;
}
