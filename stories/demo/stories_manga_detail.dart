import 'package:flutter/material.dart';
import 'package:tankobon/widgets/common/detail/description.dart';
import 'package:tankobon/widgets/common/detail/title.dart';
import 'package:tankobon/widgets/common/icon_button.dart';
import 'package:tankobon/widgets/list/manga_detail_chapter.dart';
import 'package:widgetbook/widgetbook.dart';

final List<MangaDetailChapterListItem> chapterList = [
  const MangaDetailChapterListItem(title: 'Том 10  Глава 97   Я, Любовь, Бензопила', date: '2021-01-07'),
  const MangaDetailChapterListItem(title: 'Том 10  Глава 96   На вкус, как...', date: '2020-12-27'),
  const MangaDetailChapterListItem(
    title: 'Том 10  Глава 95   Человек-бензопила против демона порабощения',
    date: '2020-12-12',
  ),
  const MangaDetailChapterListItem(title: 'Том 10  Глава 93   Ты и паршивые фильмы', date: '2020-12-04'),
  const MangaDetailChapterListItem(title: 'Том 10  Глава 92   Зомби, Кровь, Бензопила', date: '2020-11-23'),
  const MangaDetailChapterListItem(title: 'Том 10  Глава 91   Пауэр, Пауэр, Пауэр', date: '2020-11-16'),
];

WidgetbookWidget mangaDetailStories() => WidgetbookWidget(
      name: 'Manga details widgets',
      useCases: [
        WidgetbookUseCase(
          name: 'Title',
          builder: (context) => const Padding(
            padding: EdgeInsets.all(8),
            child: Center(
              child: MangaDetailTitle(
                url:
                    'https://imgcover.manga-chan.me/showfull_retina/uploads/posts/2018-12/thumbs/1543869967_aeec2409-ba96-460d-917f-0d7b6029771d.jpg',
                title: 'Chainsaw Man (Человек-бензопила)',
                author: 'Fujimoto Tatsuki',
                status: '11 томов, выпуск завершен',
              ),
            ),
          ),
        ),
        WidgetbookUseCase(
          name: 'Buttons',
          builder: (context) => Padding(
            padding: const EdgeInsets.all(8),
            child: Center(
              child: IntrinsicHeight(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Expanded(child: Button(icon: Icons.remove_red_eye, text: 'Следить')),
                    Expanded(child: Button(icon: Icons.bookmark, text: 'Хочу прочитать')),
                    Expanded(child: Button(icon: Icons.check, text: 'Прочитано')),
                    Expanded(child: Button(icon: Icons.favorite, text: 'Избранное')),
                  ],
                ),
              ),
            ),
          ),
        ),
        WidgetbookUseCase(
          name: 'Description',
          builder: (context) => const Padding(
            padding: EdgeInsets.all(8),
            child: Center(
              child: MangaDetailDescription(
                text:
                    '«Я всегда мечтал жить обычной жизнью: спать в тёплой постели, есть тосты с джемом по утрам, ходить на свидания со своей девушкой и улыбаться каждый день. Но всё изменилось со смертью отца — теперь, Потита, пора убивать!» — с такими словами Дэндзи вместе со своим псом-бензопилой Потитой отправляется на очередной контракт, ведь они — охотники на демонов. Каждый день они убивают ради денег, которые Дэндзи должен отдать одному якудза, иначе долг покойного отца придётся отдать собственной жизнью. Но что ждёт Дэндзи, когда он вернёт весь долг: заживёт обычной жизнью или продолжит спасать мир от демонов? А может, у судьбы свои планы на участь героя?',
              ),
            ),
          ),
        ),
        WidgetbookUseCase(
          name: 'List',
          builder: (context) => Padding(
            padding: const EdgeInsets.all(8),
            child: Center(
              child: MangaDetailChapterList(itemList: chapterList, total: '262 главы'),
            ),
          ),
        ),
      ],
    );
