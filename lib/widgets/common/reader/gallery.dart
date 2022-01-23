import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tankobon/models/manga_reader.dart';
import 'package:tankobon/widgets/common/reader/reader.dart';
import 'package:tankobon/widgets/common/reader/thumbnail.dart';

class MangaReaderGallery extends HookWidget {
  const MangaReaderGallery({Key? key, required this.mangaContent}) : super(key: key);

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
      Navigator.of(context).push(
        CupertinoPageRoute<void>(
          builder: (context) => MangaReaderView(
            page: contentToPages(mangaContent),
            initialIndex: index,
            isVertical: isVertical.value,
          ),
        ),
      );
    }

    return Wrap(
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
                            (page) => SizedBox(
                              height: 150,
                              child: MangaReaderThumbnail(
                                item: page,
                                onTap: () {
                                  open(context, page.pageTag);
                                },
                              ),
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
    );
  }
}
