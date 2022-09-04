import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:tankobon/api/models/manga.dart';
import 'package:tankobon/router/router.dart';
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
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                context.pushRoute(
                  GalleryViewRoute(
                    manga: manga,
                    volume: i,
                  ),
                );
              },
              child: MangaImage(
                mangaId: manga.id,
                volume: i,
                chapter: 0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
