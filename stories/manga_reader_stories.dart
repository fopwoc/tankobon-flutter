import 'package:flutter/material.dart';
import 'package:manga_reader/manga_reader/widgets/manga_reader_content.dart';
import 'package:manga_reader/manga_reader/widgets/manga_reader_gallery.dart';

MangaReaderContent testManga = MangaReaderContent(
  chapter: [
    MangaReaderChapter(
      chapterTitle: "Том 1 Глава 8",
      page: [
        MangaReaderPage(
          pageUrl: "https://img2.manga-chan.me/manga/u/1315618397_ubunchu_v1_ch8/ubunchu_v1_ch8_000.jpg",
          thumbnailUrl:
              "https://im4.manga-chan.me/manganew_thumbs_retina/u/1315618397_ubunchu_v1_ch8/ubunchu_v1_ch8_000.jpg",
          pageTag: 0,
        ),
        MangaReaderPage(
          pageUrl: "https://img2.manga-chan.me/manga/u/1315618397_ubunchu_v1_ch8/ubunchu_v1_ch8_001.jpg",
          thumbnailUrl:
              "https://im4.manga-chan.me/manganew_thumbs_retina/u/1315618397_ubunchu_v1_ch8/ubunchu_v1_ch8_001.jpg",
          pageTag: 1,
        ),
        MangaReaderPage(
          pageUrl: "https://img2.manga-chan.me/manga/u/1315618397_ubunchu_v1_ch8/ubunchu_v1_ch8_002.jpg",
          thumbnailUrl:
              "https://im4.manga-chan.me/manganew_thumbs_retina/u/1315618397_ubunchu_v1_ch8/ubunchu_v1_ch8_002.jpg",
          pageTag: 2,
        ),
        MangaReaderPage(
          pageUrl: "https://img2.manga-chan.me/manga/u/1315618397_ubunchu_v1_ch8/ubunchu_v1_ch8_003.jpg",
          thumbnailUrl:
              "https://im4.manga-chan.me/manganew_thumbs_retina/u/1315618397_ubunchu_v1_ch8/ubunchu_v1_ch8_003.jpg",
          pageTag: 3,
        ),
        MangaReaderPage(
          pageUrl: "https://img2.manga-chan.me/manga/u/1315618397_ubunchu_v1_ch8/ubunchu_v1_ch8_004.jpg",
          thumbnailUrl:
              "https://im4.manga-chan.me/manganew_thumbs_retina/u/1315618397_ubunchu_v1_ch8/ubunchu_v1_ch8_004.jpg",
          pageTag: 4,
        ),
      ],
    ),
    MangaReaderChapter(
      chapterTitle: "Том 1 Глава 7",
      page: [
        MangaReaderPage(
          pageUrl: "https://img2.manga-chan.me/manga/u/1315618425_ubunchu_v1_ch7/ubunchu_v1_ch7_000.jpg",
          thumbnailUrl:
              "https://im4.manga-chan.me/manganew_thumbs_retina/u/1315618425_ubunchu_v1_ch7/ubunchu_v1_ch7_000.jpg",
          pageTag: 5,
        ),
        MangaReaderPage(
          pageUrl: "https://img2.manga-chan.me/manga/u/1315618425_ubunchu_v1_ch7/ubunchu_v1_ch7_001.jpg",
          thumbnailUrl:
              "https://im4.manga-chan.me/manganew_thumbs_retina/u/1315618425_ubunchu_v1_ch7/ubunchu_v1_ch7_001.jpg",
          pageTag: 6,
        ),
        MangaReaderPage(
          pageUrl: "https://img2.manga-chan.me/manga/u/1315618425_ubunchu_v1_ch7/ubunchu_v1_ch7_002.jpg",
          thumbnailUrl:
              "https://im4.manga-chan.me/manganew_thumbs_retina/u/1315618425_ubunchu_v1_ch7/ubunchu_v1_ch7_002.jpg",
          pageTag: 7,
        ),
      ],
    ),
  ],
);

Widget gallery() => Center(
      child: MangaReaderGallery(
        mangaContent: testManga,
      ),
    );
