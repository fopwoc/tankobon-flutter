import 'package:flutter/material.dart';
import 'package:tankobon/widgets/common/manga_cover.dart';
import 'package:tankobon/widgets/list/manga.dart';
import 'package:widgetbook/widgetbook.dart';

final List<PureMangaCover> mangaRead = [
  const PureMangaCover(
    title: 'Demon Incidents (Инцидент Кэмоно)',
    img: 'https://imgcover.manga-chan.me/showfull_retina/uploads/posts/2017-03/thumbs/1490629254_00a.jpg',
    rating: '',
  ),
  const PureMangaCover(
    title: 'Ijiranaide, Nagatoro-san (Не издевайся, Нагаторо-сан)',
    img: 'https://imgcover.manga-chan.me/showfull_retina/uploads/posts/2017-11/thumbs/1510928199_f-list.jpg',
    rating: '',
  ),
  const PureMangaCover(
    title: 'The World God only Knows (Одному лишь Богу ведомый мир)',
    img: 'https://imgcover.manga-chan.me/showfull_retina/uploads/posts/2012-07/thumbs/1342196249_i133139.jpg',
    rating: '',
  ),
  const PureMangaCover(
    title: 'Land of the Lustrous (Страна самоцветов)',
    img: 'https://imgcover.manga-chan.me/showfull_retina/uploads/posts/2014-02/thumbs/1392293364_i177955.jpg',
    rating: '',
  ),
  const PureMangaCover(
    title: 'Sword Art Online: Project Alicization (Искусство Меча Онлайн: Проект «Алисизация»)',
    img: 'https://imgcover.manga-chan.me/showfull_retina/uploads/posts/2014-02/thumbs/1392293364_i177955.jp',
    rating: '',
  ),
];

WidgetbookWidget mangaCoverListStories() => WidgetbookWidget(
      name: 'manga list',
      useCases: [
        WidgetbookUseCase(
          name: 'listing',
          builder: (context) => Padding(
            padding: const EdgeInsets.all(8),
            child: Center(
              child: MangaList(
                mangaList: mangaRead,
              ),
            ),
          ),
        ),
      ],
    );
