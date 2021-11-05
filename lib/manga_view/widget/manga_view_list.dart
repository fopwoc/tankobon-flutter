import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

enum MangaViewListSort { regular, reversed }

class MangaViewList extends HookWidget {
  const MangaViewList({Key? key, required this.itemList, required this.total}) : super(key: key);

  final List<MangaViewListItem> itemList;
  final String total;

  @override
  Widget build(BuildContext context) {
    final sort = useState(MangaViewListSort.regular);

    final Map<MangaViewListSort, List<MangaViewListItem>> sortFromSort = {
      MangaViewListSort.regular: List.of(itemList),
      MangaViewListSort.reversed: List.of(itemList).reversed.toList(),
    };

    final Map<MangaViewListSort, Widget> iconFromSort = {
      MangaViewListSort.regular: const Icon(Icons.sort),
      MangaViewListSort.reversed: Transform.rotate(angle: 180 * pi / 180, child: const Icon(Icons.sort)),
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
                        (sort.value == MangaViewListSort.regular)
                            ? sort.value = MangaViewListSort.reversed
                            : sort.value = MangaViewListSort.regular;
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

class MangaViewListItem extends StatelessWidget {
  const MangaViewListItem({Key? key, required this.title, required this.date}) : super(key: key);

  final String title;
  final String date;

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
                  onTap: () {},
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
