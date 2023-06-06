import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:flutter_platform_widgets/flutter_platform_widgets.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:tankobon/api/models/user.dart";
import "package:tankobon/api/services/user.dart";
import "package:tankobon/domain/collections/instance.dart";
import "package:tankobon/domain/database/current_instance.dart";
import "package:tankobon/domain/database/instances.dart";
import "package:tankobon/domain/exception/handler/common.dart";
import "package:tankobon/domain/hooks/spin.dart";
import "package:tankobon/domain/provider/logger_provider.dart";
import "package:tankobon/domain/service/login.dart";
import "package:tankobon/domain/state/current_instance_state.dart";
import "package:tankobon/gen/strings.g.dart";
import "package:tankobon/view/login_view.dart";
import "package:tankobon/widget/common/spin_button.dart";

@RoutePage()
class SettingsView extends HookWidget {
  const SettingsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final meState = useSpin(() async {
      final text = await genericExceptionHandler<User>(context, getMe);
      LoggerProvider.fine(text.toJson());
    });

    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: PlatformText(t.settings.title),
      ),
      body: Center(
        child: Wrap(
          alignment: WrapAlignment.center,
          runSpacing: 14,
          children: <Widget>[
            Text("Settings WIP ${context.router.current.name}"),
            PlatformElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const InstanceSelectionList(),
                ),
              ),
              child: PlatformText("Change instance"),
            ),
            SpinButton(
              spin: meState.isSpinning,
              onClick: meState.run,
              child: PlatformText("me (prints result in terminal)"),
            ),
          ],
        ),
      ),
    );
  }
}

class InstanceSelectionList extends HookConsumerWidget {
  const InstanceSelectionList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(currentInstanceStateProvider);
    final instanceFuture = useMemoized(getInstanceList, [state]);
    final instanceSnapshot = useFuture(instanceFuture);

    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: PlatformText("instance"),
      ),
      body: (instanceSnapshot.connectionState.index == 3)
          ? Padding(
              padding: const EdgeInsets.only(top: 128),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Wrap(
                    runSpacing: 32,
                    children: [
                      PlatformElevatedButton(
                        onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const LoginView(
                              redirect: false,
                            ),
                          ),
                        ),
                        child: PlatformText("add"),
                      ),
                      ...instanceSnapshot.data!.map(
                        (e) => TestInstanceElement(
                          instance: e,
                          current: state,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : Container(),
    );
  }
}

class TestInstanceElement extends HookConsumerWidget {
  const TestInstanceElement({
    required this.instance,
    required this.current,
    super.key,
  });

  final Instance instance;
  final String? current;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[Text(instance.instanceId)],
        ),
        Row(
          children: <Widget>[
            PlatformElevatedButton(
              onPressed: (instance.instanceId == current)
                  ? null
                  : () {
                      setCurrentInstance(instance.instanceId);
                      ref.read(currentInstanceStateProvider.notifier).state =
                          instance.instanceId;
                    },
              child: PlatformText("set"),
            ),
            PlatformElevatedButton(
              onPressed: () {
                loginOut(context, ref);
              },
              child: PlatformText("logout"),
            ),
          ],
        ),
      ],
    );
  }
}
