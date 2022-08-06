import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:tankobon/api/models/manga.dart';
import 'package:tankobon/api/services/manga.dart';

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
    final mangaFuture = useMemoized(() async {
      final list = List.generate(
        manga.volume[volume],
        (index) => getImageFromBackend(manga.id, volume, index),
      );

      final list2 = [];

      for (var value in list) {
        list2.add(await value);
      }

      return list2;
    }, [reloadKey.value]);
    final mangaSnapshot = useFuture<List<dynamic>>(mangaFuture);

    return PlatformScaffold(
      backgroundColor: Colors.black,
      body: mangaSnapshot.connectionState.index == 3
          ? PhotoViewGallery.builder(
              builder: (BuildContext context, int index) {
                return PhotoViewGalleryPageOptions(
                  imageProvider: (mangaSnapshot.data![index] as Image).image,
                  initialScale: PhotoViewComputedScale.contained,
                );
              },
              itemCount: manga.volume[volume],
              loadingBuilder: (context, event) => Center(
                child: Container(
                  width: 20.0,
                  height: 20.0,
                  child: CircularProgressIndicator(),
                ),
              ),
            )
          : Container(),
    );
  }
}
