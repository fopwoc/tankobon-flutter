import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:tankobon/widget/common/title/title_description.dart";
import "package:widgetbook/widgetbook.dart";

import '../../../mock.dart';
import '../../../wrapper.dart';

final caseTitleDescription = WidgetbookUseCase(
  name: "Title description",
  builder: (context) => const _CaseTitleDescription(),
);

class _CaseTitleDescription extends HookWidget {
  const _CaseTitleDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetbookWrapper(
      child: TitleDescription(
        text: context.knobs.string(
          label: "text",
          initialValue: mockText,
        ),
      ),
    );
  }
}
