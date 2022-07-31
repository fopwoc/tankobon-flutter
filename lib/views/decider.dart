import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:provider/provider.dart';
import 'package:tankobon/domain/state/global_state.dart';
import 'package:tankobon/router/router.gr.dart';

class DeciderView extends HookWidget {
  const DeciderView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<GlobalState>();

    useEffect(
      () {
        state.initGlobalState();
        return null;
      },
      [],
    );

    if (state.hasInitialized) {
      FlutterNativeSplash.remove();
      state.currentInstance != null
          ? context.router.replace(const DashboardView())
          : context.router.replace(const LoginView());
    }

    return PlatformScaffold(
      body: Container(),
    );
  }
}
