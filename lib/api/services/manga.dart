import "package:tankobon/api/models/manga.dart";
import "package:tankobon/domain/service/http.dart";

Future<List<Manga>> getMangaList() async {
  final response = await getHttp("/content/manga");
  final mangaList = <Manga>[];

  for (final item in response.data as List<dynamic>) {
    final result = Manga.fromJson(item as Map<String, dynamic>);
    mangaList.add(result);
  }

  return mangaList;
}

Future<Manga> getManga(String id) async {
  final response = await getHttp("/content/manga/$id");

  return Manga.fromJson(response.data as Map<String, dynamic>);
}
