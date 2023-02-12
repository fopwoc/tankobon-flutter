import 'package:freezed_annotation/freezed_annotation.dart';

part 'manga.freezed.dart';
part 'manga.g.dart';

@freezed
class Manga with _$Manga {
  const factory Manga({
    required String uuid,
    required String title,
    required String description,
    required String cover,
    required List<MangaVolume> volume,
  }) = _Manga;

  factory Manga.fromJson(Map<String, Object?> json) => _$MangaFromJson(json);

  @override
  String toString() => toJson().toString();
}

@freezed
class MangaVolume with _$MangaVolume {
  const factory MangaVolume({
    required int order,
    required String? title,
    required List<String> content,
  }) = _MangaVolume;

  factory MangaVolume.fromJson(Map<String, Object?> json) =>
      _$MangaVolumeFromJson(json);

  @override
  String toString() => toJson().toString();
}
