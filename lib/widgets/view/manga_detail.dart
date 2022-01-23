import 'package:flutter/material.dart';
import 'package:tankobon/widgets/common/detail/description.dart';
import 'package:tankobon/widgets/common/detail/title.dart';
import 'package:tankobon/widgets/common/icon_button.dart';
import 'package:tankobon/widgets/list/manga_detail_chapter.dart';

class PureMangaDetailView extends StatelessWidget {
  const PureMangaDetailView({
    Key? key,
    required this.title,
    required this.coverUrl,
    required this.author,
    required this.status,
    required this.description,
    required this.total,
    required this.chapterList,
  }) : super(key: key);

  final String title;
  final String coverUrl;
  final String author;
  final String status;
  final String description;
  final String total;
  final List<MangaDetailChapterListItem> chapterList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          runSpacing: 16,
          children: [
            MangaDetailTitle(
              url: coverUrl,
              title: title,
              author: author,
              status: status,
            ),
            MangaDetailDescription(text: description),
            IntrinsicHeight(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Expanded(child: Button(icon: Icons.remove_red_eye, text: 'Следить')),
                  Expanded(child: Button(icon: Icons.bookmark, text: 'Хочу прочитать')),
                  Expanded(child: Button(icon: Icons.check, text: 'Прочитано')),
                  Expanded(child: Button(icon: Icons.favorite, text: 'Избранное')),
                ],
              ),
            ),
            MangaDetailChapterList(itemList: chapterList, total: total),
          ],
        )
      ],
    );
  }
}
