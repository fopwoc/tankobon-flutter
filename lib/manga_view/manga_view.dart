import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:manga_reader/manga_view/widget/manga_view_buttons.dart';
import 'package:manga_reader/manga_view/widget/manga_view_description.dart';
import 'package:manga_reader/manga_view/widget/manga_view_list.dart';
import 'package:manga_reader/manga_view/widget/manga_view_title.dart';

class MangaView extends StatelessWidget {
  const MangaView(
      {Key? key,
      required this.title,
      required this.coverUrl,
      required this.author,
      required this.status,
      required this.description,
      required this.total,
      required this.chapterList})
      : super(key: key);

  final String title;
  final String coverUrl;
  final String author;
  final String status;
  final String description;
  final String total;
  final List<MangaViewListItem> chapterList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(fontSize: 16),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Wrap(
                runSpacing: 16,
                children: [
                  MangaViewTitle(
                    url: coverUrl,
                    title: title,
                    author: author,
                    status: status,
                  ),
                  const MangaViewButtons(),
                  MangaViewDescription(
                    text: description,
                  ),
                  MangaViewList(itemList: chapterList, total: total)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
