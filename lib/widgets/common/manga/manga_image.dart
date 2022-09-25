import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:tankobon/api/services/image.dart';

class MangaImage extends StatelessWidget {
  const MangaImage({
    super.key,
    required this.mangaId,
    required this.volume,
    required this.chapter,
  });

  final String mangaId;
  final int volume;
  final int chapter;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List>(
      future: getImage(mangaId, volume, chapter),
      builder: (BuildContext context, AsyncSnapshot<Uint8List> snapshot) {
        if (snapshot.hasData) {
          return Image.memory(snapshot.data!);
        } else if (snapshot.hasError) {
          return const Icon(Icons.error_outline);
        } else {
          return PlatformCircularProgressIndicator();
        }
      },
    );
  }
}
