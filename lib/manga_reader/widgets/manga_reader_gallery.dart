import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:manga_reader/manga_reader/widgets/manga_reader_content.dart';
import 'package:manga_reader/manga_reader/widgets/manga_reader_thumbnail.dart';

class MangaReaderGallery extends HookWidget {
  const MangaReaderGallery({Key? key, required this.mangaContent})
      : super(key: key);

  final MangaReaderContent mangaContent;

  @override
  Widget build(BuildContext context) {
    final isVertical = useState(false);

    List<MangaReaderPage> contentToPages(MangaReaderContent content) {
      final returnVar = <MangaReaderPage>[];
      for (final chapter in content.chapter) {
        for (final page in chapter.page) {
          returnVar.add(page);
        }
      }
      return returnVar;
    }

    void open(BuildContext context, final int index) {
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => MangaReaderView(
      //       page: contentToPages(mangaContent),
      //       initialIndex: index,
      //       isVertical: isVertical.value,
      //     ),
      //   ),
      // );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Manga reader demo'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Wrap(
            children: [
              ...mangaContent.chapter
                  .map(
                    (chapter) => Column(
                      children: [
                        Text(chapter.chapterTitle),
                        Wrap(
                          children: [
                            ...chapter.page
                                .map(
                                  (page) => MangaReaderThumbnail(
                                    item: page,
                                    onTap: () {
                                      open(context, page.pageTag);
                                    },
                                  ),
                                )
                                .toList(),
                          ],
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}
