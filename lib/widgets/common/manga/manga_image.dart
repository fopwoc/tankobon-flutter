import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:tankobon/api/services/manga.dart';

class MangaImage extends StatelessWidget {
  const MangaImage({
    super.key,
    required this.mangaId,
    required this.volume,
    required this.chapter,
  });

  final String mangaId;
  final int volume;
  final int chapter;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Image>(
      future: getThumbnailFromBackend(mangaId, volume, chapter),
      builder: (BuildContext context, AsyncSnapshot<Image> snapshot) {
        if (snapshot.hasData) {
          return snapshot.data!;
        } else if (snapshot.hasError) {
          return const Icon(Icons.error_outline);
        } else {
          return PlatformCircularProgressIndicator();
        }
      },
    );
  }
}
