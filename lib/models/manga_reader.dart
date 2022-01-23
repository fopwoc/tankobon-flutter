class MangaReaderPage {
  MangaReaderPage({required this.pageUrl, this.thumbnailUrl, required this.pageTag});
  final String pageUrl;
  final String? thumbnailUrl;
  final int pageTag;
}

class MangaReaderChapter {
  MangaReaderChapter({required this.chapterTitle, required this.page});
  final String chapterTitle;
  final List<MangaReaderPage> page;
}

class MangaReaderContent {
  MangaReaderContent({required this.chapter});
  final List<MangaReaderChapter> chapter;
}
