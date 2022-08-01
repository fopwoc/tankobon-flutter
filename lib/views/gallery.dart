import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:tankobon/api/models/manga.dart';
import 'package:tankobon/api/services/manga.dart';

class GalleryView extends StatelessWidget {
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
    final list = List.generate(
      manga.volume[volume],
      (index) => getImageFromBackend(
        manga.id,
        volume,
        index,
      ),
    );

    return PlatformScaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: PageView.builder(
          controller: PageController(),
          itemCount: manga.volume[volume],
          itemBuilder: (BuildContext context, int itemIndex) {
            return FutureBuilder<Image>(
              future: list[itemIndex],
              builder: (BuildContext context, AsyncSnapshot<Image> snapshot) {
                if (snapshot.hasData) {
                  return InteractiveViewer(
                    minScale: 0.5,
                    maxScale: 4,
                    child: Image(image: snapshot.data!.image),
                  );
                } else if (snapshot.hasError) {
                  return const Icon(Icons.error_outline);
                } else {
                  return const CircularProgressIndicator();
                }
              },
            );
          },
          // itemBuilder: [
          //   ...list.map(
          //     (e) => FutureBuilder<Image>(
          //       future: e,
          //       builder: (BuildContext context, AsyncSnapshot<Image> snapshot) {
          //         if (snapshot.hasData) {
          //           return Image(image: snapshot.data!.image);
          //         } else if (snapshot.hasError) {
          //           return const Icon(Icons.error_outline);
          //         } else {
          //           return const CircularProgressIndicator();
          //         }
          //       },
          //     ),
          //   ),
          // ],
        ),
      ),
    );
  }
}
