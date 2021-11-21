import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:widgetbook/widgetbook.dart';

import 'manga_list_stories.dart';
import 'manga_reader_stories.dart';
import 'manga_stories.dart';
import 'manga_view_stories.dart';

void main() {
  runApp(const Playground());
}

class Playground extends HookWidget {
  const Playground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Widgetbook(
      devices: const [
        Apple.iPhone12,
        Apple.iPhone11,
        Apple.iPhoneSE2020,
        Apple.iPhoneSE2016,
        Samsung.s10,
        Samsung.s21ultra,
        Apple.iMacM1,
        Device(
          name: 'Windows',
          resolution: Resolution(
            nativeSize: DeviceSize(width: 1920, height: 1080),
            scaleFactor: 1,
          ),
          type: DeviceType.desktop,
        ),
      ],
      appInfo: AppInfo(name: 'Manga app'),
      lightTheme: ThemeData(primarySwatch: Colors.blue),
      darkTheme: ThemeData.dark(),
      categories: [
        WidgetbookCategory(
          name: 'widgets test',
          folders: [
            WidgetbookFolder(
              name: 'manga',
              widgets: [
                mangaStories(),
                mangaListStories(),
                mangaViewStories(),
                mangaReaderStories(),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
