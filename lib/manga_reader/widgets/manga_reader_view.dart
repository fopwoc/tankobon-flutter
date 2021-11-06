import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:manga_reader/manga_reader/widgets/manga_reader_content.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

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
    return Scaffold(
      body: Container(
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
                  width: 32.0,
                  height: 32.0,
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
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "back",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                  Text(
                    "Image ${currentIndex.value + 1}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                      decoration: null,
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
