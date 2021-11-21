import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'widget/manga.dart';

class MangaList extends StatelessWidget {
  const MangaList({Key? key, required this.mangaList}) : super(key: key);

  final List<Manga> mangaList;

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: GridView.builder(
        itemCount: mangaList.length,
        itemBuilder: (BuildContext context, int index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 200),
            child: SlideAnimation(
              verticalOffset: 50,
              duration: const Duration(milliseconds: 100),
              child: FadeInAnimation(child: mangaList[index]),
            ),
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: MediaQuery.of(context).size.width ~/ 140,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 208 / 291,
        ),
      ),
    );
  }
}
