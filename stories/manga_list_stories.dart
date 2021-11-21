import 'package:flutter/material.dart';
import 'package:manga_reader/manga_list/manga_list.dart';
import 'package:manga_reader/manga_list/widget/manga.dart';
import 'package:widgetbook/widgetbook.dart';

final List<Manga> mangaList = [
  Manga(
    title: "Demon Incidents (Инцидент Кэмоно)",
    url:
        "https://imgcover.manga-chan.me/showfull_retina/uploads/posts/2017-03/thumbs/1490629254_00a.jpg",
    rate: 8,
    onClick: () {
      print("a");
    },
  ),
  const Manga(
      title: "Ijiranaide, Nagatoro-san (Не издевайся, Нагаторо-сан)",
      url:
          "https://imgcover.manga-chan.me/showfull_retina/uploads/posts/2017-11/thumbs/1510928199_f-list.jpg",
      rate: 24),
  const Manga(
      title:
          "Sword Art Online: Project Alicization (Искусство Меча Онлайн: Проект «Алисизация»)",
      url:
          "https://imgcover.manga-chan.me/showfull_retina/uploads/posts/2014-02/thumbs/1392293364_i177955.jp"),
];

final List<Manga> mangaRead = [
  const Manga(
      title: "Demon Incidents (Инцидент Кэмоно)",
      url:
          "https://imgcover.manga-chan.me/showfull_retina/uploads/posts/2017-03/thumbs/1490629254_00a.jpg",
      last: 5),
  const Manga(
      title: "Ijiranaide, Nagatoro-san (Не издевайся, Нагаторо-сан)",
      url:
          "https://imgcover.manga-chan.me/showfull_retina/uploads/posts/2017-11/thumbs/1510928199_f-list.jpg",
      last: 24),
  const Manga(
      title: "The World God only Knows (Одному лишь Богу ведомый мир)",
      url:
          "https://imgcover.manga-chan.me/showfull_retina/uploads/posts/2012-07/thumbs/1342196249_i133139.jpg",
      last: 120),
  const Manga(
    title: "Land of the Lustrous (Страна самоцветов)",
    url:
        "https://imgcover.manga-chan.me/showfull_retina/uploads/posts/2014-02/thumbs/1392293364_i177955.jpg",
  ),
];

WidgetbookWidget mangaListStories() => WidgetbookWidget(
      name: 'manga list',
      useCases: [
        WidgetbookUseCase(
          name: 'listing',
          builder: (context) => Center(
            child: MangaList(
              mangaList: mangaList,
            ),
          ),
        ),
        WidgetbookUseCase(
          name: 'reading',
          builder: (context) => Center(
            child: MangaList(
              mangaList: mangaRead,
            ),
          ),
        ),
      ],
    );
