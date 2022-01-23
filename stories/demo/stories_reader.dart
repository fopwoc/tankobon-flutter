import 'package:flutter/material.dart';
import 'package:tankobon/models/manga_reader.dart';
import 'package:tankobon/widgets/common/reader/thumbnail.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookWidget mangaReaderThumbnailStories() => WidgetbookWidget(
      name: 'Reader thumbnail',
      useCases: [
        WidgetbookUseCase(
          name: 'Default',
          builder: (context) => Padding(
            padding: const EdgeInsets.all(8),
            child: Center(
              child: MangaReaderThumbnail(
                item: MangaReaderPage(
                  pageTag: 1,
                  pageUrl:
                      'https://im4.manga-chan.me/manganew_thumbs_retina/u/1315618397_ubunchu_v1_ch8/ubunchu_v1_ch8_000.jpg',
                ),
              ),
            ),
          ),
        ),
        WidgetbookUseCase(
          name: 'broken url',
          builder: (context) => Padding(
            padding: const EdgeInsets.all(8),
            child: Center(
              child: MangaReaderThumbnail(
                item: MangaReaderPage(
                  pageTag: 1,
                  pageUrl: 'http://broken',
                ),
              ),
            ),
          ),
        ),
      ],
    );
