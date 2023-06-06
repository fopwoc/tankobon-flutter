import "package:flutter/cupertino.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:flutter_platform_widgets/flutter_platform_widgets.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:tankobon/domain/hooks/spin.dart";
import "package:tankobon/domain/state/form/login_form.dart";
import "package:tankobon/gen/strings.g.dart";
import "package:tankobon/widget/common/spin_button.dart";

class LoginFormWidget extends HookConsumerWidget {
  const LoginFormWidget({
    required this.onSubmit,
    this.redirect = true,
    super.key,
  });

  final AsyncCallback onSubmit;
  final bool redirect;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final i18n = t.login.form;

    final store = ref.watch(loginFormStateProvider);
    final storeNotifier = ref.read(loginFormStateProvider.notifier);

    final loginState = useSpin(() async {
      await onSubmit();
    });

    return Wrap(
      runSpacing: 16,
      children: <Widget>[
        PlatformTextField(
          hintText: i18n.hint.instance,
          controller: useTextEditingController(text: store.instance),
          onChanged: storeNotifier.updateInstance,
        ),
        PlatformTextField(
          hintText: i18n.hint.username,
          controller: useTextEditingController(text: store.username),
          onChanged: storeNotifier.updateUsername,
        ),
        PlatformTextField(
          hintText: i18n.hint.password,
          controller: useTextEditingController(text: store.password),
          onChanged: storeNotifier.updatePassword,
          obscureText: true,
          autocorrect: false,
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: SpinButton(
                  onClick: store.isValid ? loginState.run : null,
                  spin: loginState.isSpinning,
                  child: Text(i18n.loginButton),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
