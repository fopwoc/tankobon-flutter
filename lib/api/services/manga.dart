import 'package:flutter/material.dart';
import 'package:tankobon/api/dio_client.dart';
import 'package:tankobon/api/models/manga.dart';
import 'package:tankobon/domain/database/current_instance.dart';
import 'package:tankobon/domain/database/instances.dart';

Future<List<Manga>> getMangaList() async {
  final token = await getTokenDatabase(await getCurrentInstanceDatabase());

  if (token == null) throw FlutterError('getTokenRepository null');

  final response = await getURL(
    url: '${token.url}/manga',
    token: token.accessToken,
  ).onError((error, stackTrace) => throw FlutterError('$error'));

  final mangaList = <Manga>[];

  for (final item in response.data as List<dynamic>) {
    final result = Manga.fromJson(item as Map<String, dynamic>);
    mangaList.add(result);
  }

  return mangaList;
}

Future<Image> getImageFromBackend(
  String mangaId,
  int volume,
  int chapter,
) async {
  final token = await getTokenDatabase(await getCurrentInstanceDatabase());

  if (token == null) throw FlutterError('getTokenRepository null');

  final response = await getURL(
    url: '${token.url}/manga/$mangaId/$volume/$chapter',
    token: token.accessToken,
    contentType: 'image/jpeg',
  ).onError((error, stackTrace) => throw FlutterError('$error'));

  return response.data as Image;
}

Future<NetworkImage> getThumbnailFromBackend(
  String mangaId,
  int volume,
  int chapter,
) async {
  final token = await getTokenDatabase(await getCurrentInstanceDatabase());

  if (token == null) throw FlutterError('getTokenRepository null');

  // final response = await getURL(
  //   url: '${token.url}/thumb/$mangaId/$volume/$chapter',
  //   token: token.accessToken,
  //   contentType: 'image/jpeg',
  // ).onError((error, stackTrace) => throw FlutterError('$error'));

  final image = NetworkImage(
    '${token.url}/thumb/$mangaId/$volume/$chapter',
    headers: {
      'authorization': 'Bearer ${token.accessToken}',
    },
  );

  return image;
}
