import 'package:json_annotation/json_annotation.dart';

part 'manga_list.g.dart';

@JsonSerializable()
class MangaList {
  MangaList({
    required this.token,
  });

  factory MangaList.fromJson(Map<String, dynamic> json) => _$MangaListFromJson(json);

  Map<String, dynamic> toJson() => _$MangaListToJson(this);

  final List<MangaListItem> token;

  @override
  String toString() => toJson().toString();
}

@JsonSerializable()
class MangaListItem {
  MangaListItem({
    required this.uuid,
    required this.fileName,
    required this.volume,
  });

  factory MangaListItem.fromJson(Map<String, dynamic> json) => _$MangaListItemFromJson(json);

  Map<String, dynamic> toJson() => _$MangaListItemToJson(this);

  final String uuid;
  final String fileName;
  final List<int> volume;

  @override
  String toString() => toJson().toString();
}
