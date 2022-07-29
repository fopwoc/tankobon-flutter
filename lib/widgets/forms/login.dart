import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:tankobon/domain/hooks/spin.dart';
import 'package:tankobon/domain/models/login.dart';
import 'package:tankobon/l10n/l10n.dart';
import 'package:tankobon/widgets/common/spin_button.dart';

class LoginForm extends HookWidget {
  const LoginForm({super.key, required this.callback});

  final void Function(LoginPayload) callback;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final instanceController = useTextEditingController();
    final instanceText = useState('http://localhost:8080');
    instanceController.text = instanceText.value; //DELETE

    final loginController = useTextEditingController();
    final loginText = useState('user');
    loginController.text = loginText.value; //DELETE

    final passwordController = useTextEditingController();
    final passwordText = useState('password');
    passwordController.text = passwordText.value; //DELETE

    final loginState = useSpin(() async {
      await Future(
        () => callback(
          LoginPayload(
            instance: instanceText.value,
            username: loginText.value,
            password: passwordText.value,
          ),
        ),
      );
    });

    return Wrap(
      runSpacing: 16,
      children: <Widget>[
        PlatformTextField(
          hintText: l10n.loginInstanceFieldHint,
          focusNode: useFocusNode(),
          controller: instanceController,
          onChanged: (e) => instanceText.value = e,
        ),
        PlatformTextField(
          hintText: l10n.loginUsernameFieldHint,
          focusNode: useFocusNode(),
          controller: loginController,
          onChanged: (e) => loginText.value = e,
        ),
        PlatformTextField(
          hintText: l10n.loginPasswordFieldHint,
          focusNode: useFocusNode(),
          controller: passwordController,
          obscureText: true,
          autocorrect: false,
          onChanged: (e) => passwordText.value = e,
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
