import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:tankobon/widget/common/spin_button.dart";
import "package:widgetbook/widgetbook.dart";

import "../../wrapper.dart";

final caseSpinButton = WidgetbookComponent(
  name: "Spin button",
  useCases: [
    WidgetbookUseCase(
      name: "Default",
      builder: (context) => const _CaseSpinButton(),
    ),
  ],
);

class _CaseSpinButton extends HookWidget {
  const _CaseSpinButton({super.key});

  @override
  Widget build(BuildContext context) {
    final spinState = useState(false);

    return WidgetbookWrapper(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: SpinButton(
                  onClick: () {
                    spinState.value = true;
                    Future.delayed(
                      const Duration(seconds: 2),
                      () => spinState.value = false,
                    );
                  },
                  spin: spinState.value,
                  child: Text(
                    context.knobs.string(
                      label: "text",
                      initialValue: "text",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
