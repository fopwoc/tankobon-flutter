import "package:freezed_annotation/freezed_annotation.dart";

part "manga_content_item.freezed.dart";

@freezed
class MangaContentItem with _$MangaContentItem {
  const factory MangaContentItem({
    required String mangaId,
    required String volumeId,
    required String pageId,
    required String pageHash,
  }) = _MangaContentItem;
}
