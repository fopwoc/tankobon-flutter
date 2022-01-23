import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tankobon/widgets/common/manga_image.dart';
import 'package:tankobon/widgets/common/tankobon_ratio.dart';
import 'package:tankobon/widgets/common/text_pill.dart';

class PureMangaCover extends StatelessWidget {
  const PureMangaCover({
    Key? key,
    required this.title,
    required this.img,
    this.rating,
    this.onClick,
  }) : super(key: key);

  final String title;
  final String img;
  final String? rating;
  final VoidCallback? onClick;

  @override
  Widget build(BuildContext context) {
    return TankobonRatio(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor.withOpacity(0.4),
              spreadRadius: 0.5,
              blurRadius: 2,
              offset: const Offset(0, 1.5), // changes position of shadow
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: onClick,
            child: Stack(
              fit: StackFit.expand,
              clipBehavior: Clip.antiAlias,
              children: [
                MangaImage(url: img),
                if (rating?.isNotEmpty ?? false)
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: TextPill(
                        text: rating!,
                      ),
                    ),
                  ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.8),
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        title,
                        maxLines: 2,
                        style: const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
