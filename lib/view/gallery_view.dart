import "package:auto_route/auto_route.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:flutter_platform_widgets/flutter_platform_widgets.dart";
import "package:tankobon/api/models/manga.dart";
import "package:tankobon/api/services/manga.dart";
import "package:tankobon/domain/exception/handler/common.dart";
import "package:tankobon/domain/models/manga_content_item.dart";
import "package:tankobon/widget/common/gallery/gallery.dart";

@RoutePage()
class GalleryView extends HookWidget {
  const GalleryView({
    @pathParam required this.mangaId,
    @pathParam required this.volumeId,
    @pathParam required this.pageId,
    super.key,
  });

  final String mangaId;
  final String volumeId;
  final String pageId;

  @override
  Widget build(BuildContext context) {
    final appbarState = useState(false);
    final appBarAnimationController = useAnimationController(
      duration: const Duration(milliseconds: 200),
    );

    final reloadKey = useState(UniqueKey());
    final mangaFuture = useMemoized(
      () async => _getMangaImages(
        await genericExceptionHandler<Manga>(
          context,
          () => getManga(mangaId),
        ),
      ),
      [reloadKey.value],
    );

    final mangaSnapshot = useFuture(mangaFuture);

    useEffect(
      () {
        if (appbarState.value) {
          appBarAnimationController.animateTo(
            0,
            curve: Curves.easeOut,
          );
        } else {
          appBarAnimationController.animateTo(
            1,
            curve: Curves.easeIn,
          );
        }
      },
      [appbarState.value],
    );

    return WillPopScope(
      onWillPop: () async => false,
      child: PlatformScaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            if (mangaSnapshot.connectionState == ConnectionState.done &&
                mangaSnapshot.data != null)
              OrientationBuilder(
                builder: (context, orientation) => Gallery(
                  items: mangaSnapshot.data!,
                  initialIndex: _volumeFirstPageIndex(
                    mangaSnapshot.data!,
                    volumeId,
                    pageId,
                  ),
                  orientation: orientation,
                  onClick: () => appbarState.value = !appbarState.value,
                ),
              )
            else
              Center(
                child: PlatformCircularProgressIndicator(),
              ),
            AnimatedBuilder(
              animation: appBarAnimationController..view,
              builder: (context, child) => Stack(
                children: [
                  Transform.translate(
                    offset: Offset(
                      0,
                      -appBarAnimationController.value *
                          (MediaQuery.of(context).padding.top + 64),
                    ),
                    child: PlatformAppBar(
                      leading: CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          PlatformIcons(context).back,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

int _volumeFirstPageIndex(
  List<MangaContentItem> mangaContent,
  String volumeId,
  String pageId,
) {
  return mangaContent
      .indexWhere((e) => e.volumeId == volumeId && e.pageId == pageId);
}

List<MangaContentItem> _getMangaImages(Manga manga) {
  return [
    ...manga.content.map((ev) {
      final list = <MangaContentItem>[];

      for (var i = 0; i < ev.content.length; i++) {
        list.add(
          MangaContentItem(
            mangaId: manga.id,
            volumeId: ev.id,
            pageId: ev.content[i].id,
            pageHash: ev.content[i].hash,
          ),
        );
      }

      return list;
    }),
  ].expand((list) => list).toList();
}
