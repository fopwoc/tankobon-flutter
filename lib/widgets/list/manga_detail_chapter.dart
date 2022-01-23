import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

enum MangaDetailChapterListSort { regular, reversed }

class MangaDetailChapterList extends HookWidget {
  const MangaDetailChapterList({Key? key, required this.itemList, required this.total}) : super(key: key);

  final List<MangaDetailChapterListItem> itemList;
  final String total;

  @override
  Widget build(BuildContext context) {
    final sort = useState(MangaDetailChapterListSort.regular);

    final sortFromSort = <MangaDetailChapterListSort, List<MangaDetailChapterListItem>>{
      MangaDetailChapterListSort.regular: List.of(itemList),
      MangaDetailChapterListSort.reversed: List.of(itemList).reversed.toList(),
    };

    final iconFromSort = <MangaDetailChapterListSort, Widget>{
      MangaDetailChapterListSort.regular: const Icon(Icons.sort),
      MangaDetailChapterListSort.reversed: Transform.rotate(
        angle: 180 * pi / 180,
        child: const Icon(Icons.sort),
      ),
    };

    return Wrap(
      children: <Widget>[
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      total,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 16),
                    ),
                  ),
                  Material(
                    child: IconButton(
                      onPressed: () {
                        (sort.value == MangaDetailChapterListSort.regular)
                            ? sort.value = MangaDetailChapterListSort.reversed
                            : sort.value = MangaDetailChapterListSort.regular;
                      },
                      icon: iconFromSort[sort.value]!,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        ...sortFromSort[sort.value]!
      ],
    );
  }
}

class MangaDetailChapterListItem extends StatelessWidget {
  const MangaDetailChapterListItem({Key? key, required this.title, required this.date, this.onClick}) : super(key: key);

  final String title;
  final String date;
  final VoidCallback? onClick;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: onClick,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 12),
                          maxLines: 1,
                        ),
                        Text(
                          date,
                          style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.access_time),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
