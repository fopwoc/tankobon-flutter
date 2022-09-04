import 'package:flutter/material.dart';
import 'package:tankobon/domain/database/current_instance.dart';
import 'package:tankobon/domain/database/instances.dart';

Future<Image> getImageFromBackend(
  String mangaId,
  int volume,
  int chapter,
) async {
  final token = await getInstance(await getCurrentInstance());

  final image = Image.network(
    '${token.url}/manga/$mangaId/$volume/$chapter',
    headers: {
      'authorization': 'Bearer ${token.accessToken}',
    },
  );

  return image;
}

Future<Image> getThumbnailFromBackend(
  String mangaId,
  int volume,
  int chapter,
) async {
  final token = await getInstance(await getCurrentInstance());

  final image = Image.network(
    '${token.url}/thumb/$mangaId/$volume/$chapter',
    headers: {
      'authorization': 'Bearer ${token.accessToken}',
    },
  );

  return image;
}
