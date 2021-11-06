import 'package:flutter/material.dart';
import 'package:manga_reader/manga_reader/widgets/manga_reader_content.dart';

class MangaReaderThumbnail extends StatelessWidget {
  const MangaReaderThumbnail({Key? key, required this.item, this.onTap}) : super(key: key);

  final MangaReaderPage item;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: GestureDetector(
        onTap: onTap,
        child: Hero(
          tag: item.pageTag,
          child: SizedBox(
            height: 150,
            child: Image.network((item.thumbnailUrl == null) ? item.pageUrl : item.thumbnailUrl!),
          ),
        ),
      ),
    );
  }
}
