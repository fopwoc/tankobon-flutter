import 'package:flutter/material.dart';
import 'package:manga_reader/manga_list/widget/manga.dart';

Widget common() => const Center(
      child: Manga(
        title: "Demon Incidents (Инцидент Кэмоно)",
        url: "https://imgcover.manga-chan.me/showfull_retina/uploads/posts/2017-03/thumbs/1490629254_00a.jpg",
      ),
    );

Widget rating() => const Center(
      child: Manga(
        title: "Demon Incidents (Инцидент Кэмоно)",
        url: "https://imgcover.manga-chan.me/showfull_retina/uploads/posts/2017-03/thumbs/1490629254_00a.jpg",
        rate: 1234,
      ),
    );

Widget reading() => const Center(
      child: Manga(
        title: "Demon Incidents (Инцидент Кэмоно)",
        url: "https://imgcover.manga-chan.me/showfull_retina/uploads/posts/2017-03/thumbs/1490629254_00a.jpg",
        last: 1234,
      ),
    );

Widget noUrl() => const Center(
      child: Manga(
        title: "Sword Art Online: Project Alicization (Искусство Меча Онлайн: Проект «Алисизация»)",
        url: "",
      ),
    );
