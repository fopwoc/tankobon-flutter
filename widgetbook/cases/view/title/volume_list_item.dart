import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:tankobon/widget/common/cover/cover.dart";
import "package:tankobon/widget/common/cover/cover_image.dart";
import "package:tankobon/widget/common/volume/volume_list_item.dart";
import "package:widgetbook/widgetbook.dart";

import "../../../mock.dart";
import "../../../wrapper.dart";

final caseVolumeItemList = WidgetbookUseCase(
  name: "Volume item",
  builder: (context) => const _CaseVolumeItemList(),
);

class _CaseVolumeItemList extends HookWidget {
  const _CaseVolumeItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetbookWrapper(
      child: VolumeListItem(
        cover: Cover.pure(
          image: CoverImage.raw(
            uri: mockImageUrls[0],
          ),
        ),
        title: context.knobs.string(
          label: "title",
          initialValue: "title",
        ),
        onClick: () {},
      ),
    );
  }
}
