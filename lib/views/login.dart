import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:tankobon/domain/repositories/login.dart';
import 'package:tankobon/router/router.dart';
import 'package:tankobon/widgets/forms/login.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
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
                  await loginInRepository(context, v);
                  await context.router.replace(const DeciderViewRoute());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
