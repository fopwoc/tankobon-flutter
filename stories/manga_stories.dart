import 'package:flutter/material.dart';
import 'package:manga_reader/manga_list/widget/manga.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookWidget mangaStories() => WidgetbookWidget(
      name: 'manga cover',
      useCases: [
        WidgetbookUseCase(
          name: 'default',
          builder: (context) => const Center(
            child: Manga(
              title: "Demon Incidents (Инцидент Кэмоно)",
              url:
                  "https://imgcover.manga-chan.me/showfull_retina/uploads/posts/2017-03/thumbs/1490629254_00a.jpg",
            ),
          ),
        ),
        WidgetbookUseCase(
          name: 'reading',
          builder: (context) => const Center(
            child: Manga(
              title: "Demon Incidents (Инцидент Кэмоно)",
              url:
                  "https://imgcover.manga-chan.me/showfull_retina/uploads/posts/2017-03/thumbs/1490629254_00a.jpg",
              last: 1234,
            ),
          ),
        ),
        WidgetbookUseCase(
          name: 'rating',
          builder: (context) => const Center(
            child: Manga(
              title: "Demon Incidents (Инцидент Кэмоно)",
              url:
                  "https://imgcover.manga-chan.me/showfull_retina/uploads/posts/2017-03/thumbs/1490629254_00a.jpg",
              rate: 1234,
            ),
          ),
        ),
        WidgetbookUseCase(
          name: 'broken url',
          builder: (context) => const Center(
            child: Manga(
              title:
                  "Sword Art Online: Project Alicization (Искусство Меча Онлайн: Проект «Алисизация»)",
              url: "",
            ),
          ),
        ),
      ],
    );
