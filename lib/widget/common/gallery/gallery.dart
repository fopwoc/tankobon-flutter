import "dart:math";

import "package:collection/collection.dart";
import "package:flutter/widgets.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:image_size_getter/image_size_getter.dart";
import "package:photo_view/photo_view.dart";
import "package:photo_view/photo_view_gallery.dart";
import "package:tankobon/domain/models/manga_content_item.dart";
import "package:tankobon/domain/provider/logger_provider.dart";
import "package:tankobon/widget/common/gallery/gallery_page.dart";

class Gallery extends HookWidget {
  const Gallery({
    required this.items,
    required this.initialIndex,
    required this.orientation,
    required this.onClick,
    super.key,
  });

  final List<MangaContentItem> items;
  final int initialIndex;
  final Orientation orientation;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    final pageController = useState(
      PageController(
        initialPage: initialIndex,
      ),
    );

    final cacheImageState = useState<List<Size?>>(
      List.generate(items.length, (index) => null),
    );

    final pageOptionsState = useState<List<PhotoViewGalleryPageOptions>>([]);

    useEffect(
      () {
        pageOptionsState.value = [
          ...items.mapIndexed(
            (i, e) => PhotoViewGalleryPageOptions.customChild(
              child: GalleryPage(
                key: Key("image-$i"),
                content: items[i],
                callback: (imageBinary) {
                  final memoryImageSize =
                      ImageSizeGetter.getSize(MemoryInput(imageBinary));

                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    final (scale, offset) = _calcImageProps(
                      context,
                      memoryImageSize,
                      orientation,
                    );

                    cacheImageState.value[i] = memoryImageSize;

                    pageOptionsState.value[i].controller!
                      ..scale = scale
                      ..position = offset;
                  });
                },
              ),
              controller: PhotoViewController(),
              basePosition: Alignment.center,
              tightMode: true,
              onTapUp: (context, __, ___) => onClick(),
            ),
          ),
        ];

        return null;
      },
      [orientation],
    );

    return PhotoViewGallery(
      pageOptions: pageOptionsState.value,
      pageController: pageController.value,
    );
  }
}

(double, Offset) _calcImageProps(
  BuildContext context,
  Size size,
  Orientation orientation,
) {
  final safeArea = MediaQuery.of(context).padding;
  final displayArea = MediaQuery.of(context).size;

  final scale = switch (orientation) {
    Orientation.landscape => size.width /
        (size.width - (displayArea.width - (safeArea.left + safeArea.right))),
    Orientation.portrait => 1.0,
  };

  final offset = switch (orientation) {
    Orientation.landscape => max<double>(
        (((size.height) * scale) - displayArea.height) / 2,
        0,
      ),
    Orientation.portrait => 0.0
  };

  final offsetDirectory = switch (orientation) {
    Orientation.landscape => Offset.fromDirection(
        pi / 2,
        offset,
      ),
    Orientation.portrait => Offset.zero,
  };

  LoggerProvider.fine("NEW PARAMS $scale $offsetDirectory");

  return (scale, offsetDirectory);
}
