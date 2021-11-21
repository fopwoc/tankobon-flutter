import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:manga_reader/widget/manga_image.dart';
import 'package:manga_reader/widget/text_pill.dart';

class Manga extends StatelessWidget {
  const Manga(
      {Key? key,
      required this.title,
      required this.url,
      this.rate,
      this.last,
      this.onClick})
      : super(key: key);

  final String title;
  final String url;
  final int? rate;
  final int? last;
  final VoidCallback? onClick;

  final BorderRadius borderRadius = const BorderRadius.all(Radius.circular(5));

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 208 / 291,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: borderRadius,
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
          borderRadius: borderRadius,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: onClick,
            child: Stack(
              fit: StackFit.expand,
              clipBehavior: Clip.antiAlias,
              children: [
                MangaImage(url: url),
                if (last != null)
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: TextPill(
                        text: last.toString(),
                        color: Colors.blue.withOpacity(0.9),
                      ),
                    ),
                  ),
                if (rate != null)
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: TextPill(
                        text: rate.toString(),
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
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12),
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
