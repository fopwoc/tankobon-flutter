import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:manga_reader/widget/manga_image.dart';
import 'package:manga_reader/widget/text_pill.dart';

class Manga extends StatelessWidget {
  const Manga({Key? key, required this.title, required this.url, this.rate, this.last, this.onClick}) : super(key: key);

  final String title;
  final String url;
  final int? rate;
  final int? last;
  final VoidCallback? onClick;

  final double height = 220 * 0.85;
  final double width = 150 * 0.85;
  final BorderRadius borderRadius = const BorderRadius.all(Radius.circular(5));

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
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
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Center(
              child: MangaImage(url: url, height: height - 1, width: width - 1),
            ),
            if (last != null)
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
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
                  padding: const EdgeInsets.all(4.0),
                  child: TextPill(
                    text: rate.toString(),
                  ),
                ),
              ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: height / 3,
                width: width + 1,
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
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    maxLines: 2,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onClick,
                child: SizedBox(
                  height: height,
                  width: width,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
