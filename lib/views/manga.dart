import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:tankobon/api/models/manga.dart';
import 'package:tankobon/widgets/common/reader/volume_view.dart';

class MangaView extends StatelessWidget {
  const MangaView({super.key, required this.manga});

  final Manga manga;

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: PlatformText('view'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(context.router.current.name),
              Text(manga.id),
              Text(manga.title),
              Text(manga.description),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: VolumeView(manga: manga),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
