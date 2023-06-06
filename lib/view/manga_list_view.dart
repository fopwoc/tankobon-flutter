import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:flutter_platform_widgets/flutter_platform_widgets.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:tankobon/api/models/manga.dart";
import "package:tankobon/api/services/manga.dart";
import "package:tankobon/domain/exception/handler/common.dart";
import "package:tankobon/domain/state/current_instance_state.dart";
import "package:tankobon/gen/strings.g.dart";
import "package:tankobon/router/app_router.dart";
import "package:tankobon/widget/common/cover/cover.dart";
import "package:tankobon/widget/list/cover_list.dart";

@RoutePage()
class MangaListView extends HookConsumerWidget {
  const MangaListView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mangaFuture = useMemoized(
      () => genericExceptionHandler<List<Manga>>(
        context,
        getMangaList,
      ),
      [ref.watch(currentInstanceStateProvider)],
    );
    final mangaSnapshot = useFuture(mangaFuture);

    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: PlatformText(t.instance.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: (mangaSnapshot.connectionState == ConnectionState.done &&
                mangaSnapshot.data != null)
            ? CoverList(
                rowCount: 2,
                children: [
                  ...?mangaSnapshot.data?.map(
                    (e) => Cover(
                      manga: e,
                      onClick: () => context.pushRoute(
                        MangaTitleRoute(mangaId: e.id),
                      ),
                    ),
                  ),
                ],
              )
            : Center(
                child: PlatformCircularProgressIndicator(),
              ),
      ),
    );
  }
}
