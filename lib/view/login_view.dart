import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_platform_widgets/flutter_platform_widgets.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:tankobon/domain/exception/handler/common.dart";
import "package:tankobon/domain/service/login.dart";
import "package:tankobon/gen/assets.gen.dart";
import "package:tankobon/router/app_router.dart";
import "package:tankobon/widget/forms/login.dart";

@RoutePage()
class LoginView extends HookConsumerWidget {
  const LoginView({
    super.key,
    @pathParam this.redirect = true,
  });

  final bool redirect;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PlatformScaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.svg.logo.path,
              height: 160,
            ),
            Text("login ${context.router.current.name}"),
            Padding(
              padding: const EdgeInsets.all(32),
              child: LoginFormWidget(
                redirect: redirect,
                onSubmit: () async {
                  await genericExceptionHandler(
                    context,
                    () async {
                      await loginIn(ref);
                      if (redirect) {
                        if (context.mounted) {
                          await context.router.replace(const DeciderRoute());
                        }
                      } else {
                        if (context.mounted) Navigator.of(context).pop();
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
