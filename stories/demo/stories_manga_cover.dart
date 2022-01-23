import 'package:flutter/material.dart';
import 'package:tankobon/widgets/common/manga_cover.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookWidget mangaCoverStories() => WidgetbookWidget(
      name: 'manga cover',
      useCases: [
        WidgetbookUseCase(
          name: 'default',
          builder: (context) => const Padding(
            padding: EdgeInsets.all(8),
            child: Center(
              child: PureMangaCover(
                title: 'Demon Incidents (Инцидент Кэмоно)',
                img: 'https://imgcover.manga-chan.me/showfull_retina/uploads/posts/2017-03/thumbs/1490629254_00a.jpg',
              ),
            ),
          ),
        ),
        WidgetbookUseCase(
          name: 'rating',
          builder: (context) => const Padding(
            padding: EdgeInsets.all(8),
            child: Center(
              child: PureMangaCover(
                title: 'Demon Incidents (Инцидент Кэмоно)',
                img: 'https://imgcover.manga-chan.me/showfull_retina/uploads/posts/2017-03/thumbs/1490629254_00a.jpg',
                rating: '1234',
              ),
            ),
          ),
        ),
        WidgetbookUseCase(
          name: 'broken url',
          builder: (context) => const Padding(
            padding: EdgeInsets.all(8),
            child: Center(
              child: PureMangaCover(
                title: 'Sword Art Online: Project Alicization (Искусство Меча Онлайн: Проект «Алисизация»)',
                img: 'http://broken',
              ),
            ),
          ),
        ),
      ],
    );
