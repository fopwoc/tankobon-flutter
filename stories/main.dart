import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:widgetbook/widgetbook.dart';

import 'demo/stories_button.dart';
import 'demo/stories_manga_cover.dart';
import 'demo/stories_manga_cover_list.dart';
import 'demo/stories_manga_detail.dart';
import 'demo/stories_manga_detail_view.dart';
import 'demo/stories_reader.dart';
import 'demo/stories_reader_view.dart';
import 'demo/stories_text_pill.dart';

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
      defaultTheme: ThemeMode.light,
      darkTheme: ThemeData.dark(),
      categories: [
        WidgetbookCategory(
          name: 'Widgets',
          folders: [
            WidgetbookFolder(
              name: 'Common elements',
              widgets: [
                buttonStories(),
                textPillStories(),
              ],
            ),
            WidgetbookFolder(
              name: 'Manga covers',
              widgets: [
                mangaCoverStories(),
                mangaCoverListStories(),
              ],
            ),
            WidgetbookFolder(
              name: 'Manga details',
              widgets: [
                mangaDetailStories(),
                mangaDetailViewStories(),
              ],
            ),
            WidgetbookFolder(
              name: 'Reader',
              widgets: [
                mangaReaderThumbnailStories(),
                mangaReaderViewStories(),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
