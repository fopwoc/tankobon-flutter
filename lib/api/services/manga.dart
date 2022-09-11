import 'dart:convert';

import 'package:tankobon/api/models/manga.dart';
import 'package:tankobon/domain/service/http.dart';

Future<List<Manga>> getMangaList() async {
  final response = await getHttp('/manga');
  final mangaList = <Manga>[];

  for (final item in jsonDecode(response.body) as List<dynamic>) {
    final result = Manga.fromJson(item as Map<String, dynamic>);
    mangaList.add(result);
  }

  return mangaList;
}
