import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:manga_reader/widget/manga_image.dart';

class MangaViewTitle extends StatelessWidget {
  const MangaViewTitle({
    Key? key,
    required this.url,
    required this.title,
    required this.author,
    required this.status,
  }) : super(key: key);

  final String url;
  final String title;
  final String author;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          child: SizedBox(
            height: 180,
            child: AspectRatio(
              aspectRatio: 208 / 291,
              child: MangaImage(
                url: url,
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  runSpacing: 12,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(fontSize: 20),
                    ),
                    Text(
                      author,
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontSize: 12),
                    ),
                    Text(
                      status,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 12),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
