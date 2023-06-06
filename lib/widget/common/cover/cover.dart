import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:tankobon/api/models/manga.dart";
import "package:tankobon/widget/common/cover/cover_image.dart";
import "package:tankobon/widget/common/tankobon_ratio.dart";

abstract class Cover extends StatelessWidget {
  const factory Cover({
    required Manga manga,
    required void Function() onClick,
    Key? key,
  }) = _Cover;

  const factory Cover.pure({
    required CoverImage image,
    String? title,
    VoidCallback? onClick,
    Key? key,
  }) = _PureCover;

  const Cover._({super.key});
}

class _Cover extends Cover {
  const _Cover({
    required this.manga,
    required this.onClick,
    super.key,
  }) : super._();

  final Manga manga;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return _PureCover(
      image: CoverImage(
        mangaId: manga.id,
        volumeId: manga.content[0].id,
        pageId: manga.content[0].content[0].id,
      ),
      title: manga.title,
      onClick: onClick,
    );
  }
}

class _PureCover extends Cover {
  const _PureCover({
    required this.image,
    this.title,
    this.onClick,
    super.key,
  }) : super._();

  final String? title;
  final CoverImage image;
  final VoidCallback? onClick;

  @override
  Widget build(BuildContext context) {
    final colorGradient = Theme.of(context).canvasColor;

    return TankobonRatio(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor.withOpacity(0.4),
              spreadRadius: 0.5,
              blurRadius: 2,
              offset: const Offset(0, 1.5), // changes position of shadow
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: onClick,
            child: Stack(
              fit: StackFit.expand,
              clipBehavior: Clip.antiAlias,
              children: [
                image,
                if (title?.isNotEmpty ?? false)
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.transparent,
                            Colors.transparent,
                            colorGradient.withOpacity(0.4),
                            colorGradient,
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          title!,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
