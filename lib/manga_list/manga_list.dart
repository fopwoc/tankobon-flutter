import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'widget/manga.dart';

class MangaList extends StatelessWidget {
  const MangaList({Key? key, required this.mangaList}) : super(key: key);

  final List<Manga> mangaList;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [...mangaList],
    );
  }
}
