import 'package:flutter/material.dart';
import 'package:manga_reader/manga_view/widget/manga_view_buttons.dart';
import 'package:manga_reader/manga_view/widget/manga_view_description.dart';
import 'package:manga_reader/manga_view/widget/manga_view_list.dart';
import 'package:manga_reader/manga_view/widget/manga_view_title.dart';

Widget view() => Scaffold(
      appBar: AppBar(
        title: const Text(
          "Chainsaw Man (Человек-бензопила)",
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Wrap(
                runSpacing: 16,
                children: [
                  title(),
                  buttons(),
                  description(),
                  list(),
                ],
              )
            ],
          ),
        ),
      ),
    );

Widget title() => const Center(
      child: MangaViewTitle(
        url:
            "https://imgcover.manga-chan.me/showfull_retina/uploads/posts/2018-12/thumbs/1543869967_aeec2409-ba96-460d-917f-0d7b6029771d.jpg",
        title: "Chainsaw Man (Человек-бензопила)",
        author: "Fujimoto Tatsuki",
        status: "11 томов, выпуск завершен",
      ),
    );

Widget buttons() => const Center(child: MangaViewButtons());

Widget description() => const Center(
      child: MangaViewDescription(
        text:
            "«Я всегда мечтал жить обычной жизнью: спать в тёплой постели, есть тосты с джемом по утрам, ходить на свидания со своей девушкой и улыбаться каждый день. Но всё изменилось со смертью отца — теперь, Потита, пора убивать!» — с такими словами Дэндзи вместе со своим псом-бензопилой Потитой отправляется на очередной контракт, ведь они — охотники на демонов. Каждый день они убивают ради денег, которые Дэндзи должен отдать одному якудза, иначе долг покойного отца придётся отдать собственной жизнью. Но что ждёт Дэндзи, когда он вернёт весь долг: заживёт обычной жизнью или продолжит спасать мир от демонов? А может, у судьбы свои планы на участь героя?",
      ),
    );

final List<MangaViewListItem> chapterList = [
  const MangaViewListItem(title: "Том 10  Глава 97   Я, Любовь, Бензопила", date: "2021-01-07"),
  const MangaViewListItem(title: "Том 10  Глава 96   На вкус, как...", date: "2020-12-27"),
  const MangaViewListItem(title: "Том 10  Глава 95   Человек-бензопила против демона порабощения", date: "2020-12-12"),
  const MangaViewListItem(title: "Том 10  Глава 93   Ты и паршивые фильмы", date: "2020-12-04"),
  const MangaViewListItem(title: "Том 10  Глава 92   Зомби, Кровь, Бензопила", date: "2020-11-23"),
  const MangaViewListItem(title: "Том 10  Глава 91   Пауэр, Пауэр, Пауэр", date: "2020-11-16"),
];

Widget list() => Center(
      child: MangaViewList(itemList: chapterList, total: "262 главы"),
    );
