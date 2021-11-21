import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:manga_reader/widget/icon_button.dart';

class MangaViewButtons extends HookWidget {
  const MangaViewButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Expanded(
              child: MangaButton(icon: Icons.remove_red_eye, text: 'Следить')),
          Expanded(
              child: MangaButton(icon: Icons.bookmark, text: 'Хочу прочитать')),
          Expanded(child: MangaButton(icon: Icons.check, text: 'Прочитано')),
          Expanded(child: MangaButton(icon: Icons.favorite, text: 'Избранное')),
        ],
      ),
    );
  }
}
