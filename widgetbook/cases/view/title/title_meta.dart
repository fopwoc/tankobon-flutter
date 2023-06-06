import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:tankobon/widget/common/cover/cover.dart";
import "package:tankobon/widget/common/cover/cover_image.dart";
import "package:tankobon/widget/common/title/title_meta.dart";
import "package:widgetbook/widgetbook.dart";

import "../../../mock.dart";
import "../../../wrapper.dart";

final caseTitleMeta = WidgetbookUseCase(
  name: "Title meta",
  builder: (context) => const _CaseTitleMeta(),
);

class _CaseTitleMeta extends HookWidget {
  const _CaseTitleMeta({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetbookWrapper(
      child: TitleMeta(
        cover: Cover.pure(
          image: CoverImage.raw(
            uri: mockImageUrls[0],
          ),
        ),
        title: context.knobs.string(
          label: "title",
          initialValue: "title",
        ),
      ),
    );
  }
}
