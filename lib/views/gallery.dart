import 'dart:async';
import 'dart:math';
import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:image_size_getter/image_size_getter.dart';
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

    return PlatformScaffold(
      backgroundColor: Colors.black,
      body: mangaSnapshot.connectionState.index == 3
          ? PhotoViewGallery.builder(
              builder: (BuildContext context, int index) {
                final imageData = mangaSnapshot.data![index] as Uint8List;
                final memoryImageSize =
                    ImageSizeGetter.getSize(MemoryInput(imageData));

                final safeArea = MediaQuery.of(context).padding;
                final displayArea = MediaQuery.of(context).size;

                final scale =
                    (displayArea.width - (safeArea.right + safeArea.left)) /
                        memoryImageSize.width;
                final double offset = max(
                  (((memoryImageSize.height) * scale) - displayArea.height) / 2,
                  0,
                );

                return PhotoViewGalleryPageOptions(
                  imageProvider: Image.memory(imageData).image,
                  initialScale: scale,
                  basePosition: Alignment.center,
                  controller: PhotoViewController(
                    initialPosition: Offset.fromDirection(
                      pi / 2,
                      offset,
                    ),
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

  return manga.volume
      .map((e) => e.content.length)
      .toList()
      .slice(0, volume)
      .reduce((a, b) => a + b);
}

Future<List<Uint8List>> _getMangaImages(Manga manga) async {
  final futureList = [
    ...manga.volume.map((e) => e.content.length).mapIndexed((index, element) {
      final list = <Future<Uint8List>>[];
      for (var i = 0; i < element; i++) {
        list.add(getImage(manga.uuid, index, i));
      }
      return list;
    }).flattened
  ];

  final list = <Uint8List>[];
  for (final element in futureList) {
    list.add(await element);
  }
  return list;
}
