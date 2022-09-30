import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tankobon/gen/assets.gen.dart';
import 'package:tankobon/widgets/forms/login.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key, this.redirect = true});

  final bool redirect;

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.svg.logo.path,
              height: 160,
            ),
            Text('login ${context.router.current.name}'),
            Padding(
              padding: const EdgeInsets.all(32),
              child: LoginForm(
                redirect: redirect,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
