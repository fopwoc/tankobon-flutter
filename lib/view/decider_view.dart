import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:flutter_native_splash/flutter_native_splash.dart";
import "package:flutter_platform_widgets/flutter_platform_widgets.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:tankobon/domain/state/current_instance_state.dart";
import "package:tankobon/router/app_router.dart";

@RoutePage()
class DeciderView extends HookConsumerWidget {
  const DeciderView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentInstanceState = ref.watch(currentInstanceStateProvider);
    final currentInstanceInitState = ref.watch(instanceInitStateProvider);

    useEffect(
      () {
        ref.watch(currentInstanceStateProvider.notifier).init(ref);

        return null;
      },
      [],
    );

    useEffect(
      () {
        if (currentInstanceInitState) {
          FlutterNativeSplash.remove();
          currentInstanceState != null
              ? context.router.replace(const DashboardRoute())
              : context.router.replace(LoginRoute());
        }

        return null;
      },
      [currentInstanceInitState],
    );

    return PlatformScaffold(
      body: Container(),
    );
  }
}
