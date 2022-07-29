import 'package:flutter/widgets.dart';
import 'package:tankobon/widgets/common/tankobon_ratio.dart';

class MangaList extends StatelessWidget {
  const MangaList({super.key, required this.mangaList});

  final List<Widget> mangaList;

  @override
  Widget build(BuildContext context) {
    final crossAxisCount = (MediaQuery.of(context).size.width / 180).round();

    return GridView.builder(
      itemCount: mangaList.length,
      itemBuilder: (BuildContext context, int index) {
        return mangaList[index];
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount < 2 ? 2 : crossAxisCount,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        childAspectRatio: tankobonRatio,
      ),
    );
  }
}
