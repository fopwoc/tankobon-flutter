import "dart:typed_data";

import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:flutter_platform_widgets/flutter_platform_widgets.dart";
import "package:tankobon/api/services/image.dart";
import "package:tankobon/widget/common/progress_bar.dart";

abstract class CoverImage extends HookWidget {
  const factory CoverImage({
    required String mangaId,
    required String volumeId,
    required String pageId,
    Key? key,
  }) = _CoverImageManga;

  const factory CoverImage.raw({
    required String uri,
    Key? key,
  }) = _CoverImageRaw;

  const CoverImage._({super.key});
}

class _CoverImageRaw extends CoverImage {
  const _CoverImageRaw({
    required this.uri,
    super.key,
  }) : super._();

  final String uri;

  @override
  Widget build(BuildContext context) {
    final loadingProgress = useState<double>(0);

    final reloadKey = useState(UniqueKey());
    final imageFuture = useMemoized(
      () => getRawImage(
        uri,
        onReceiveProgress: (c, t) {
          loadingProgress.value = c / t;
        },
      ),
      [reloadKey.value],
    );
    final imageSnapshot = useFuture(imageFuture);

    return _CoverImagePure(
      snapshot: imageSnapshot,
      loadingValue: loadingProgress.value,
    );
  }
}

class _CoverImageManga extends CoverImage {
  const _CoverImageManga({
    required this.mangaId,
    required this.volumeId,
    required this.pageId,
    super.key,
  }) : super._();

  final String mangaId;
  final String volumeId;
  final String pageId;

  @override
  Widget build(BuildContext context) {
    final reloadKey = useState(UniqueKey());
    final imageFuture = useMemoized(
      () => getImage("$mangaId/$volumeId/$pageId"),
      [reloadKey.value],
    );
    final imageSnapshot = useFuture(imageFuture);

    return _CoverImagePure(
      snapshot: imageSnapshot,
    );
  }
}

class _CoverImagePure extends StatelessWidget {
  const _CoverImagePure({
    required this.snapshot,
    this.loadingValue,
  });

  final AsyncSnapshot<Uint8List> snapshot;
  final double? loadingValue;

  @override
  Widget build(BuildContext context) {
    if (snapshot.hasData) {
      return FittedBox(
        fit: BoxFit.fill,
        child: Image.memory(snapshot.data!),
      );
    } else if (snapshot.hasError) {
      return Icon(PlatformIcons(context).error);
    } else {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ProgressBar(
            value: loadingValue ?? 0,
          ),
        ),
      );
    }
  }
}
