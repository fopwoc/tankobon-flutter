import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:tankobon/widget/common/tankobon_ratio.dart";
import "package:widgetbook/widgetbook.dart";

import "../../wrapper.dart";

final caseRation = WidgetbookComponent(
  name: "Ratio",
  useCases: [
    WidgetbookUseCase(
      name: "Default",
      builder: (context) => const _CaseRatio(),
    ),
  ],
);

class _CaseRatio extends HookWidget {
  const _CaseRatio({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetbookWrapper(
      child: SizedBox(
        height: context.knobs.double.slider(
          label: "height",
          initialValue: 100,
          min: 0,
          max: 1000,
        ),
        child: TankobonRatio(
          child: Container(
            color: Colors.blueGrey,
          ),
        ),
      ),
    );
  }
}
