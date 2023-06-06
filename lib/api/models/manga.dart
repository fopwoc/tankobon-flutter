import "package:freezed_annotation/freezed_annotation.dart";

part "manga.freezed.dart";
part "manga.g.dart";

@freezed
class Manga with _$Manga {
  const factory Manga({
    required String id,
    required String title,
    required String description,
    required DateTime creation,
    required DateTime modified,
    required List<MangaVolume> content,
  }) = _Manga;

  factory Manga.fromJson(Map<String, Object?> json) => _$MangaFromJson(json);

  @override
  String toString() => toJson().toString();
}

@freezed
class MangaVolume with _$MangaVolume {
  const factory MangaVolume({
    required String id,
    required String? title,
    required List<MangaPage> content,
  }) = _MangaVolume;

  factory MangaVolume.fromJson(Map<String, Object?> json) =>
      _$MangaVolumeFromJson(json);

  @override
  String toString() => toJson().toString();
}

@freezed
class MangaPage with _$MangaPage {
  const factory MangaPage({
    required String id,
    required String hash,
  }) = _MangaPage;

  factory MangaPage.fromJson(Map<String, Object?> json) =>
      _$MangaPageFromJson(json);

  @override
  String toString() => toJson().toString();
}
