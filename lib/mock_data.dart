import 'package:flutter/cupertino.dart';

import 'manga_list/widget/manga.dart';
import 'manga_reader/widgets/manga_reader_content.dart';
import 'manga_reader/widgets/manga_reader_gallery.dart';
import 'manga_view/manga_view.dart';
import 'manga_view/widget/manga_view_list.dart';

final testManga = MangaReaderContent(
  chapter: [
    MangaReaderChapter(
      chapterTitle: 'Том 1 Глава 8',
      page: [
        MangaReaderPage(
          pageUrl:
              'https://img2.manga-chan.me/manga/u/1315618397_ubunchu_v1_ch8/ubunchu_v1_ch8_000.jpg',
          thumbnailUrl:
              'https://im4.manga-chan.me/manganew_thumbs_retina/u/1315618397_ubunchu_v1_ch8/ubunchu_v1_ch8_000.jpg',
          pageTag: 0,
        ),
        MangaReaderPage(
          pageUrl:
              'https://img2.manga-chan.me/manga/u/1315618397_ubunchu_v1_ch8/ubunchu_v1_ch8_001.jpg',
          thumbnailUrl:
              'https://im4.manga-chan.me/manganew_thumbs_retina/u/1315618397_ubunchu_v1_ch8/ubunchu_v1_ch8_001.jpg',
          pageTag: 1,
        ),
        MangaReaderPage(
          pageUrl:
              'https://img2.manga-chan.me/manga/u/1315618397_ubunchu_v1_ch8/ubunchu_v1_ch8_002.jpg',
          thumbnailUrl:
              'https://im4.manga-chan.me/manganew_thumbs_retina/u/1315618397_ubunchu_v1_ch8/ubunchu_v1_ch8_002.jpg',
          pageTag: 2,
        ),
        MangaReaderPage(
          pageUrl:
              'https://img2.manga-chan.me/manga/u/1315618397_ubunchu_v1_ch8/ubunchu_v1_ch8_003.jpg',
          thumbnailUrl:
              'https://im4.manga-chan.me/manganew_thumbs_retina/u/1315618397_ubunchu_v1_ch8/ubunchu_v1_ch8_003.jpg',
          pageTag: 3,
        ),
        MangaReaderPage(
          pageUrl:
              'https://img2.manga-chan.me/manga/u/1315618397_ubunchu_v1_ch8/ubunchu_v1_ch8_004.jpg',
          thumbnailUrl:
              'https://im4.manga-chan.me/manganew_thumbs_retina/u/1315618397_ubunchu_v1_ch8/ubunchu_v1_ch8_004.jpg',
          pageTag: 4,
        ),
      ],
    ),
    MangaReaderChapter(
      chapterTitle: 'Том 1 Глава 7',
      page: [
        MangaReaderPage(
          pageUrl:
              'https://img2.manga-chan.me/manga/u/1315618425_ubunchu_v1_ch7/ubunchu_v1_ch7_000.jpg',
          thumbnailUrl:
              'https://im4.manga-chan.me/manganew_thumbs_retina/u/1315618425_ubunchu_v1_ch7/ubunchu_v1_ch7_000.jpg',
          pageTag: 5,
        ),
        MangaReaderPage(
          pageUrl:
              'https://img2.manga-chan.me/manga/u/1315618425_ubunchu_v1_ch7/ubunchu_v1_ch7_001.jpg',
          thumbnailUrl:
              'https://im4.manga-chan.me/manganew_thumbs_retina/u/1315618425_ubunchu_v1_ch7/ubunchu_v1_ch7_001.jpg',
          pageTag: 6,
        ),
        MangaReaderPage(
          pageUrl:
              'https://img2.manga-chan.me/manga/u/1315618425_ubunchu_v1_ch7/ubunchu_v1_ch7_002.jpg',
          thumbnailUrl:
              'https://im4.manga-chan.me/manganew_thumbs_retina/u/1315618425_ubunchu_v1_ch7/ubunchu_v1_ch7_002.jpg',
          pageTag: 7,
        ),
      ],
    ),
  ],
);

List<MangaViewListItem> chapterList(BuildContext context) {
  return <MangaViewListItem>[
    MangaViewListItem(
      title: 'Том 1  Глава 8   Кто сказал "МУ"?',
      date: '2011-07-27',
      onClick: () {
        Navigator.of(context).push(
          CupertinoPageRoute<void>(
            builder: (context) => MangaReaderGallery(
              mangaContent: testManga,
            ),
          ),
        );
      },
    ),
    const MangaViewListItem(title: 'Том 1  Глава 7   ', date: '2011-07-27'),
    const MangaViewListItem(
        title: 'Том 1  Глава 6  Апгрейд в летнюю ночь', date: '2011-07-27'),
    const MangaViewListItem(
        title: 'Том 1  Глава 5   Большая сестра следит за тобой!',
        date: '2011-07-27'),
    const MangaViewListItem(
        title: 'Том 1  Глава 4  История трёх кроликов', date: '2011-07-27'),
    const MangaViewListItem(
        title: 'Том 1  Глава 3   Проблемы? Пора поюзать форум',
        date: '2011-07-27'),
    const MangaViewListItem(title: 'Том 1  Глава 2   ', date: '2011-07-27'),
    const MangaViewListItem(title: 'Том 1  Глава 1   ', date: '2011-07-27'),
  ];
}

List<Manga> mangaRead(BuildContext context) {
  return <Manga>[
    Manga(
      title: 'Ubunchu! (Убунчу!)',
      url:
          'https://imgcover.manga-chan.me/showfull_retina/uploads/posts/2011-09/thumbs/1315618354_ubunchu.jpg',
      onClick: () {
        Navigator.of(context).push(
          CupertinoPageRoute<void>(
            builder: (context) => MangaView(
              title: 'Ubunchu! (Убунчу!)',
              coverUrl:
                  'https://imgcover.manga-chan.me/showfull_retina/uploads/posts/2011-09/thumbs/1315618354_ubunchu.jpg',
              author: '	﻿Seo Hiroshi',
              status: '1 том, выпуск продолжается',
              description:
                  'Школьный компьютерный клуб разделён на три лагеря: сторонники Windows, поклонники Linux и пользователи Macintosh. И даже тот факт, что народу в этом клубе - три человека, считая председателя, не мешает им вести полномасштабные битвы (в масштабах клубной комнаты) за право поставить свою любимую систему на новенький четырёхъядерный компьютер.',
              total: '8 глав',
              chapterList: chapterList(context),
            ),
          ),
        );
      },
    ),
    const Manga(
      title: 'Demon Incidents (Инцидент Кэмоно)',
      url:
          'https://imgcover.manga-chan.me/showfull_retina/uploads/posts/2017-03/thumbs/1490629254_00a.jpg',
      last: 5,
    ),
    const Manga(
      title: 'Ijiranaide, Nagatoro-san (Не издевайся, Нагаторо-сан)',
      url:
          'https://imgcover.manga-chan.me/showfull_retina/uploads/posts/2017-11/thumbs/1510928199_f-list.jpg',
      last: 24,
    ),
    const Manga(
      title: 'The World God only Knows (Одному лишь Богу ведомый мир)',
      url:
          'https://imgcover.manga-chan.me/showfull_retina/uploads/posts/2012-07/thumbs/1342196249_i133139.jpg',
      last: 120,
    ),
    const Manga(
      title: 'Land of the Lustrous (Страна самоцветов)',
      url:
          'https://imgcover.manga-chan.me/showfull_retina/uploads/posts/2014-02/thumbs/1392293364_i177955.jpg',
    ),
  ];
}

final mangaList = <Manga>[
  Manga(
    title: 'Ubunchu! (Убунчу!)',
    url:
        'https://imgcover.manga-chan.me/showfull_retina/uploads/posts/2011-09/thumbs/1315618354_ubunchu.jpg',
    onClick: () {},
    rate: 30,
  ),
  const Manga(
    title: 'Demon Incidents (Инцидент Кэмоно)',
    url:
        'https://imgcover.manga-chan.me/showfull_retina/uploads/posts/2017-03/thumbs/1490629254_00a.jpg',
    rate: 1000,
  ),
  const Manga(
    title: 'Ijiranaide, Nagatoro-san (Не издевайся, Нагаторо-сан)',
    url:
        'https://imgcover.manga-chan.me/showfull_retina/uploads/posts/2017-11/thumbs/1510928199_f-list.jpg',
    rate: 32864,
  ),
  const Manga(
    title: 'The World God only Knows (Одному лишь Богу ведомый мир)',
    url:
        'https://imgcover.manga-chan.me/showfull_retina/uploads/posts/2012-07/thumbs/1342196249_i133139.jpg',
    rate: 1707,
  ),
  const Manga(
    title: 'Land of the Lustrous (Страна самоцветов)',
    url:
        'https://imgcover.manga-chan.me/showfull_retina/uploads/posts/2014-02/thumbs/1392293364_i177955.jpg',
    rate: 12302,
  ),
];
