import "package:flutter/material.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:tankobon/widget/common/cover/cover.dart";
import "package:tankobon/widget/common/cover/cover_image.dart";
import "package:tankobon/widget/list/cover_list.dart";
import "package:widgetbook/widgetbook.dart";

import "../../../mock.dart";
import "../../../wrapper.dart";

final caseCoverList = WidgetbookUseCase(
  name: "Manga list",
  builder: (context) => const _CaseCoverList(),
);

class _CaseCoverList extends HookConsumerWidget {
  const _CaseCoverList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WidgetbookWrapper(
      child: CoverList(
        rowCount: context.knobs.double
            .input(
              label: "count of covers in row",
              initialValue: 2,
            )
            .toInt(),
        children: [
          ...mockImageUrls.map(
            (e) => Cover.pure(
              title: context.knobs.string(
                label: "Title",
                initialValue: "Title",
              ),
              image: CoverImage.raw(
                uri: e,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
