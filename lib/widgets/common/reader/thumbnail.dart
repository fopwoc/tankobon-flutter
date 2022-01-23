import 'package:flutter/material.dart';
import 'package:tankobon/models/manga_reader.dart';
import 'package:tankobon/widgets/common/manga_image.dart';
import 'package:tankobon/widgets/common/tankobon_ratio.dart';

class MangaReaderThumbnail extends StatelessWidget {
  const MangaReaderThumbnail({Key? key, required this.item, this.onTap}) : super(key: key);

  final MangaReaderPage item;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: TankobonRatio(
        child: GestureDetector(
          onTap: onTap,
          child: Hero(
            tag: item.pageTag,
            child: MangaImage(
              url: item.pageUrl,
            ),
          ),
        ),
      ),
    );
  }
}
