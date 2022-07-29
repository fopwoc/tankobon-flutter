import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:tankobon/api/models/manga.dart';
import 'package:tankobon/api/services/manga.dart';
import 'package:tankobon/l10n/l10n.dart';
import 'package:tankobon/widgets/common/manga/manga.dart';
import 'package:tankobon/widgets/list/manga_list.dart';

class MangaListView extends StatelessWidget {
  const MangaListView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: PlatformText(l10n.dashboardNavBarList),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: FutureBuilder<List<Manga>>(
            future: getMangaList(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Manga>> snapshot) {
              if (snapshot.hasData) {
                return MangaList(
                  mangaList: [
                    ...?snapshot.data?.map(
                      (e) => MangaCover(manga: e),
                    )
                  ],
                );
              } else if (snapshot.hasError) {
                print(snapshot.error);
                return const Center(
                  child: Icon(Icons.error_outline),
                );
              } else {
                return Center(
                  child: PlatformCircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
