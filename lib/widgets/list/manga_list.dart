import 'package:flutter/widgets.dart';
import 'package:tankobon/widgets/common/tankobon_ratio.dart';

class MangaList extends StatelessWidget {
  const MangaList({super.key, required this.mangaList});

  final List<Widget> mangaList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: mangaList.length,
      itemBuilder: (BuildContext context, int index) {
        return mangaList[index];
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: tankobonRatio,
      ),
    );
  }
}
