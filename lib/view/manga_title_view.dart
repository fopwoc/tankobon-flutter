import "package:auto_route/auto_route.dart";
import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:flutter_platform_widgets/flutter_platform_widgets.dart";
import "package:tankobon/api/models/manga.dart";
import "package:tankobon/api/services/manga.dart";
import "package:tankobon/domain/exception/handler/common.dart";
import "package:tankobon/router/app_router.dart";
import "package:tankobon/widget/common/cover/cover.dart";
import "package:tankobon/widget/common/cover/cover_image.dart";
import "package:tankobon/widget/common/title/title_description.dart";
import "package:tankobon/widget/common/title/title_meta.dart";
import "package:tankobon/widget/common/volume/volume_list_item.dart";

@RoutePage()
class MangaTitleView extends HookWidget {
  const MangaTitleView({
    @pathParam required this.mangaId,
    super.key,
  });

  final String mangaId;

  @override
  Widget build(BuildContext context) {
    final mangaFuture = useMemoized(
      () => genericExceptionHandler<Manga>(
        context,
        () => getManga(mangaId),
      ),
      [],
    );
    final mangaSnapshot = useFuture(mangaFuture);

    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: PlatformText("title"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: (mangaSnapshot.connectionState == ConnectionState.done &&
                mangaSnapshot.data != null)
            ? Padding(
                padding: const EdgeInsets.only(top: 128),
                child: SingleChildScrollView(
                  child: Wrap(
                    runSpacing: 24,
                    children: [
                      TitleMeta(
                        cover: Cover.pure(
                          image: CoverImage(
                            mangaId: mangaSnapshot.data!.id,
                            volumeId: mangaSnapshot.data!.content[0].id,
                            pageId:
                                mangaSnapshot.data!.content[0].content[0].id,
                          ),
                        ),
                        title: mangaSnapshot.data!.title,
                      ),
                      TitleDescription(
                        text: mangaSnapshot.data!.description,
                      ),
                      Wrap(
                        runSpacing: 16,
                        children: [
                          ...mangaSnapshot.data!.content.mapIndexed(
                            (i, e) {
                              final mangaId = mangaSnapshot.data!.id;
                              final volumeId = e.id;
                              final pageId = e.content[0].id;

                              return VolumeListItem(
                                cover: Cover.pure(
                                  image: CoverImage(
                                    mangaId: mangaId,
                                    volumeId: volumeId,
                                    pageId: pageId,
                                  ),
                                ),
                                title: "${i + 1}: ${e.title!}",
                                onClick: () => context.pushRoute(
                                  GalleryRoute(
                                    mangaId: mangaId,
                                    volumeId: volumeId,
                                    pageId: pageId,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            : Center(
                child: PlatformCircularProgressIndicator(),
              ),
      ),
    );
  }
}
