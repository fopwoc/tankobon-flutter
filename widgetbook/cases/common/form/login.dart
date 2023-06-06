import "package:flutter/material.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:tankobon/domain/state/form/login_form.dart";
import "package:tankobon/widget/forms/login.dart";
import "package:widgetbook/widgetbook.dart";

import "../../../wrapper.dart";

final caseLoginForm = WidgetbookUseCase(
  name: "Login",
  builder: (context) => const _CaseLoginForm(),
);

class _CaseLoginForm extends HookConsumerWidget {
  const _CaseLoginForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WidgetbookWrapper(
      child: Center(
        child: LoginFormWidget(
          onSubmit: () => Future.delayed(
            const Duration(seconds: 1),
            () => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("${ref.read(loginFormStateProvider)}"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
