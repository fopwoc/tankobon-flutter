import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:provider/provider.dart';
import 'package:tankobon/api/services/login.dart';
import 'package:tankobon/domain/repositories/current_instance.dart';
import 'package:tankobon/domain/repositories/instances.dart';
import 'package:tankobon/domain/state/global_state.dart';
import 'package:tankobon/l10n/l10n.dart';
import 'package:tankobon/router/router.gr.dart';
import 'package:tankobon/widgets/forms/login.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return PlatformScaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('login ${context.router.current.name}'),
            Padding(
              padding: const EdgeInsets.all(32),
              child: LoginForm(
                callback: (v) async {
                  final token = await login(v);
                  print(token.instanceId);
                  await addTokenRepository(token, v.instance);
                  await setCurrentInstanceRepository(token.instanceId);
                  Provider.of<GlobalState>(context, listen: false)
                      .setGlobalState(token.instanceId);
                  context.router.replace(const DeciderView());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
