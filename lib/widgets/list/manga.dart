import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:tankobon/widgets/common/tankobon_ratio.dart';

class MangaList extends StatelessWidget {
  const MangaList({Key? key, required this.mangaList}) : super(key: key);

  final List<Widget> mangaList;

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
              child: FadeInAnimation(
                child: mangaList[index],
              ),
            ),
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: tankobonRatio,
        ),
      ),
    );
  }
}
