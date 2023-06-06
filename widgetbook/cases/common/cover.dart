import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:tankobon/widget/common/cover/cover.dart";
import "package:tankobon/widget/common/cover/cover_image.dart";
import "package:widgetbook/widgetbook.dart";

import "../../mock.dart";
import "../../wrapper.dart";

final caseCover = WidgetbookComponent(
  name: "Cover",
  useCases: [
    WidgetbookUseCase(
      name: "Default",
      builder: (context) => const _CaseCover(),
    ),
    WidgetbookUseCase(
      name: "No title",
      builder: (context) => const _CaseCoverNoTitle(),
    ),
    WidgetbookUseCase(
      name: "Error",
      builder: (context) => const _CaseCoverError(),
    ),
  ],
);

class _CaseCover extends HookWidget {
  const _CaseCover({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetbookWrapper(
      child: Cover.pure(
        title: context.knobs.string(
          label: "Title",
          initialValue: "Title",
        ),
        image: CoverImage.raw(
          uri: context.knobs.string(
            label: "url",
            initialValue: mockImageUrls[0],
          ),
        ),
      ),
    );
  }
}

class _CaseCoverNoTitle extends HookWidget {
  const _CaseCoverNoTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetbookWrapper(
      child: Cover.pure(
        image: CoverImage.raw(
          uri: mockImageUrls[0],
        ),
      ),
    );
  }
}

class _CaseCoverError extends HookWidget {
  const _CaseCoverError({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetbookWrapper(
      child: Cover.pure(
        title: context.knobs.string(
          label: "Title",
          initialValue: "Title",
        ),
        image: const CoverImage.raw(
          uri: "broken url",
        ),
      ),
    );
  }
}
