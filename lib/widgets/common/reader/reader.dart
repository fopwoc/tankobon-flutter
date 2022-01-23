import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:tankobon/models/manga_reader.dart';

class MangaReaderView extends HookWidget {
  const MangaReaderView({Key? key, required this.page, required this.initialIndex, this.isVertical = false})
      : super(key: key);
  final List<MangaReaderPage> page;
  final int initialIndex;
  final bool isVertical;

  List<ImageProvider> pagesToImages(List<MangaReaderPage> page) {
    return [...page.map((e) => NetworkImage(e.pageUrl)).toList()];
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = useState(initialIndex);
    final pageController = PageController(initialPage: currentIndex.value);
    return CupertinoPageScaffold(
      child: Container(
        decoration: const BoxDecoration(color: Colors.black),
        constraints: BoxConstraints.expand(
          height: MediaQuery.of(context).size.height,
        ),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: <Widget>[
            PhotoViewGallery.builder(
              scrollPhysics: const BouncingScrollPhysics(),
              builder: (BuildContext context, int index) {
                return PhotoViewGalleryPageOptions(
                  imageProvider: pagesToImages(page)[index],
                  initialScale: (MediaQuery.of(context).orientation == Orientation.portrait)
                      ? PhotoViewComputedScale.contained
                      : PhotoViewComputedScale.covered,
                  minScale: PhotoViewComputedScale.contained,
                  heroAttributes: PhotoViewHeroAttributes(tag: page[index].pageTag),
                );
              },
              itemCount: page.length,
              loadingBuilder: (context, event) => const Center(
                child: SizedBox(
                  width: 32,
                  height: 32,
                  child: CircularProgressIndicator(),
                ),
              ),
              backgroundDecoration: const BoxDecoration(color: Colors.black),
              pageController: pageController,
              onPageChanged: (v) {
                currentIndex.value = v;
              },
              scrollDirection: isVertical ? Axis.vertical : Axis.horizontal,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      if (Navigator.canPop(context)) Navigator.pop(context);
                    },
                    child: Text(
                      'back',
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            color: Colors.blue,
                          ),
                    ),
                  ),
                  Text(
                    'Image ${currentIndex.value + 1}',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          color: Colors.grey,
                        ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
