import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:tankobon/api/services/image.dart";
import "package:tankobon/domain/models/manga_content_item.dart";
import "package:tankobon/widget/common/progress_bar.dart";

class GalleryPage extends HookWidget {
  const GalleryPage({
    required this.content,
    required this.callback,
    super.key,
  });

  final MangaContentItem content;
  final void Function(Uint8List) callback;

  @override
  Widget build(BuildContext context) {
    final loadingProgress = useState<double>(0);

    final reloadKey = useState(UniqueKey());
    final imageFuture = useMemoized(
      () => getImage(
        "${content.mangaId}/${content.volumeId}/${content.pageId}",
        onReceiveProgress: (c, t) {
          loadingProgress.value = c / t;
        },
      ),
      [reloadKey.value],
    );
    final imageSnapshot = useFuture(imageFuture);

    useEffect(
      () {
        if (imageSnapshot.data != null) {
          callback(imageSnapshot.data!);
        }

        return null;
      },
      [imageSnapshot.data],
    );

    if (imageSnapshot.connectionState == ConnectionState.done &&
        imageSnapshot.hasData &&
        !imageSnapshot.hasError) {
      return Image.memory(imageSnapshot.data!);
    } else if (imageSnapshot.hasError) {
      return const Icon(Icons.error);
    } else {
      return Center(
        child: ProgressBar(
          value: loadingProgress.value,
        ),
      );
    }
  }
}
