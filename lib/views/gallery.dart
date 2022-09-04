import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:tankobon/api/models/manga.dart';
import 'package:tankobon/api/services/image.dart';

class GalleryView extends HookWidget {
  const GalleryView({
    super.key,
    required this.manga,
    this.volume = 0,
    this.chapter = 0,
  });

  final Manga manga;
  final int volume;
  final int chapter;

  @override
  Widget build(BuildContext context) {
    final reloadKey = useState(UniqueKey());
    final mangaFuture = useMemoized(
      () => _getMangaImages(manga),
      [reloadKey.value],
    );
    final mangaSnapshot = useFuture<List<dynamic>>(mangaFuture);

    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return PlatformScaffold(
      backgroundColor: Colors.black,
      body: mangaSnapshot.connectionState.index == 3
          ? PhotoViewGallery.builder(
              builder: (BuildContext context, int index) {
                return PhotoViewGalleryPageOptions(
                  imageProvider: (mangaSnapshot.data![index] as Image).image,
                  initialScale: isPortrait
                      ? PhotoViewComputedScale.contained
                      : PhotoViewComputedScale.covered,
                  basePosition:
                      isPortrait ? Alignment.center : Alignment.center,
                  controller: PhotoViewController(
                    initialPosition: Offset.fromDirection(pi / 2, 500),
                  ),
                  //scaleStateController: PhotoViewScaleStateController(),
                );
              },
              gaplessPlayback: true,
              itemCount: mangaSnapshot.data!.length,
              pageController: PageController(
                initialPage: _volumeFirstPageIndex(manga, volume),
              ),
              loadingBuilder: (context, event) => const Center(
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(),
                ),
              ),
            )
          : Container(),
    );
  }
}

int _volumeFirstPageIndex(Manga manga, int volume) {
  if (volume <= 0) return 0;
  return manga.volume.slice(0, volume).reduce((a, b) => a + b);
}

Future<List<Image>> _getMangaImages(Manga manga) async {
  final futureList = [
    ...manga.volume.mapIndexed((index, element) {
      final list = <Future<Image>>[];
      for (var i = 0; i < element; i++) {
        list.add(getImageFromBackend(manga.id, index, i));
      }
      return list;
    }).flattened
  ];

  final list = <Image>[];

  for (final element in futureList) {
    list.add(await element);
  }

  return list;
}
