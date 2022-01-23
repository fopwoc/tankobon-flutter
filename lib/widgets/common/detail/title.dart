import 'package:flutter/material.dart';
import 'package:tankobon/widgets/common/manga_image.dart';
import 'package:tankobon/widgets/common/tankobon_ratio.dart';

class MangaDetailTitle extends StatelessWidget {
  const MangaDetailTitle({
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
            child: TankobonRatio(
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
                      style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 20),
                    ),
                    Text(
                      author,
                      style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 12),
                    ),
                    Text(
                      status,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 12),
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
