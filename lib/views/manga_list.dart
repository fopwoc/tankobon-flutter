import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:tankobon/api/services/manga.dart';
import 'package:tankobon/l10n/l10n.dart';
import 'package:tankobon/router/router.dart';
import 'package:tankobon/widgets/common/manga/manga.dart';
import 'package:tankobon/widgets/list/manga_list.dart';

class MangaListView extends HookWidget {
  const MangaListView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final reloadKey = useState(UniqueKey());
    final mangaFuture = useMemoized(getMangaList, [reloadKey.value]);
    final mangaSnapshot = useFuture(mangaFuture);

    print("${mangaSnapshot.connectionState.index}");
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: PlatformText(l10n.dashboardNavBarList),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: MangaList(
          mangaList: [
            ...?mangaSnapshot.data?.map(
              (e) => MangaCover(
                manga: e,
                onClick: () => context.pushRoute(
                  MangaViewRoute(manga: e),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
