import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:tankobon/domain/exception/handler/common.dart';
import 'package:tankobon/domain/hooks/spin.dart';
import 'package:tankobon/domain/models/login.dart';
import 'package:tankobon/domain/service/login.dart';
import 'package:tankobon/domain/store/login_form.dart';
import 'package:tankobon/l10n/l10n.dart';
import 'package:tankobon/router/router.dart';
import 'package:tankobon/widgets/common/spin_button.dart';

class LoginForm extends HookWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final store = useMemoized(LoginFormStore.new);

    final loginState = useSpin(() async {
      await genericExceptionHandler(context, () async {
        await loginIn(
          context,
          LoginPayload(
            instance: store.instance,
            username: store.username,
            password: store.password,
          ),
        ).then((value) => context.router.replace(const DeciderViewRoute()));
      });
    });

    return Wrap(
      runSpacing: 16,
      children: <Widget>[
        PlatformTextField(
          hintText: l10n.loginInstanceFieldHint,
          focusNode: useFocusNode(),
          controller: TextEditingController(text: store.instance),
          onChanged: (e) => store.instance = e,
        ),
        PlatformTextField(
          hintText: l10n.loginUsernameFieldHint,
          focusNode: useFocusNode(),
          controller: TextEditingController(text: store.username),
          onChanged: (e) => store.username = e,
        ),
        PlatformTextField(
          hintText: l10n.loginPasswordFieldHint,
          focusNode: useFocusNode(),
          controller: TextEditingController(text: store.password),
          obscureText: true,
          autocorrect: false,
          onChanged: (e) => store.password = e,
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SpinButton(
                  onClick: loginState.run,
                  spin: loginState.isSpinning,
                  child: Text(l10n.loginFormButton),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
