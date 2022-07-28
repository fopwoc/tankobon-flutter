import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:tankobon/api/models/manga.dart';
import 'package:tankobon/api/services/manga.dart';
import 'package:tankobon/widgets/common/manga/manga.dart';
import 'package:tankobon/widgets/list/manga_list.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: PlatformText('title'),
      ),
      body: FutureBuilder<List<Manga>>(
          future: getMangaList(),
          builder: (BuildContext context, AsyncSnapshot<List<Manga>> snapshot) {
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
    );
  }
}
