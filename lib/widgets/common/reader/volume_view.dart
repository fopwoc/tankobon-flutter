import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:tankobon/api/models/manga.dart';
import 'package:tankobon/widgets/common/manga/manga_image.dart';

class VolumeView extends StatelessWidget {
  const VolumeView({super.key, required this.manga});

  final Manga manga;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        ...manga.volume.mapIndexed(
          (i, e) => SizedBox(
              height: 180,
              child: MangaImage(mangaId: manga.id, volume: i, chapter: 0)),
        )
      ],
    );
  }
}
