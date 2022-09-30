import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:provider/provider.dart';
import 'package:tankobon/api/models/user.dart';
import 'package:tankobon/api/services/user.dart';
import 'package:tankobon/domain/collections/instance.dart';
import 'package:tankobon/domain/database/current_instance.dart';
import 'package:tankobon/domain/database/instances.dart';
import 'package:tankobon/domain/exception/handler/common.dart';
import 'package:tankobon/domain/hooks/spin.dart';
import 'package:tankobon/domain/service/login.dart';
import 'package:tankobon/domain/state/global_state.dart';
import 'package:tankobon/l10n/l10n.dart';
import 'package:tankobon/views/login.dart';
import 'package:tankobon/widgets/common/spin_button.dart';

class SettingsView extends HookWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final meState = useSpin(() async {
      final text = await genericExceptionHandler<User>(
        context,
        () async {
          return getMe();
        },
      );
      print(text.toJson());
    });

    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: PlatformText(l10n.dashboardNavBarSettings),
      ),
      body: Center(
        child: Wrap(
          alignment: WrapAlignment.center,
          runSpacing: 14,
          children: <Widget>[
            Text('Settings WIP ${context.router.current.name}'),
            PlatformElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const TestInstanceList(),
                ),
              ),
              child: PlatformText('Change instance'),
            ),
            SpinButton(
              spin: meState.isSpinning,
              onClick: meState.run,
              child: PlatformText('me (prints result in terminal)'),
            ),
          ],
        ),
      ),
    );
  }
}

class TestInstanceList extends HookWidget {
  const TestInstanceList({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<GlobalState>();
    final instanceFuture =
        useMemoized(getInstanceList, [state.currentInstance]);
    final instanceSnapshot = useFuture(instanceFuture);

    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: PlatformText("instance"),
      ),
      body: (instanceSnapshot.connectionState.index == 3)
          ? Padding(
              padding: const EdgeInsets.only(top: 128),
              child: SingleChildScrollView(
                child: Wrap(
                  runSpacing: 32,
                  children: [
                    PlatformElevatedButton(
                      onPressed: () async => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const LoginView(
                            redirect: false,
                          ),
                        ),
                      ),
                      child: PlatformText('add'),
                    ),
                    ...instanceSnapshot.data!.map(
                      (e) => TestInstanceElement(
                        instance: e,
                        current: state.currentInstance,
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Container(),
    );
  }
}

class TestInstanceElement extends StatelessWidget {
  const TestInstanceElement({
    super.key,
    required this.instance,
    required this.current,
  });

  final Instance instance;
  final String? current;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[Text('${instance.instanceId}')],
        ),
        Row(
          children: <Widget>[
            PlatformElevatedButton(
              onPressed: (instance.instanceId == current)
                  ? null
                  : () {
                      setCurrentInstance(instance.instanceId);
                      Provider.of<GlobalState>(
                        context,
                        listen: false,
                      ).setGlobalState(instance.instanceId);
                    },
              child: PlatformText('set'),
            ),
            PlatformElevatedButton(
              onPressed: () {
                loginOut(context, instance: instance.instanceId);
              },
              child: PlatformText('logout'),
            ),
          ],
        ),
      ],
    );
  }
}
