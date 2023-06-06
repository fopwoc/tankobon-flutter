import "package:auto_route/auto_route.dart";
import "package:flutter/widgets.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:tankobon/api/services/login.dart";
import "package:tankobon/domain/database/current_instance.dart";
import "package:tankobon/domain/database/instances.dart";
import "package:tankobon/domain/state/current_instance_state.dart";
import "package:tankobon/domain/state/form/login_form.dart";
import "package:tankobon/router/app_router.dart";

Future<void> loginIn(WidgetRef ref) async {
  final payload = ref.read(loginFormStateProvider);

  final token = await login(payload);
  await addInstance(token, payload.instance);
  await setCurrentInstance(token.instanceId);

  ref.read(currentInstanceStateProvider.notifier).state = token.instanceId;
}

Future<void> loginOut(
  BuildContext context,
  WidgetRef ref, {
  String? instance,
}) async {
  await delInstance(instance ?? await getCurrentInstance());
  final newInstance = (await getInstanceList()).firstOrNull?.instanceId;
  await setCurrentInstance(newInstance);

  ref.read(currentInstanceStateProvider.notifier).state = newInstance;

  if (newInstance == null && context.mounted) {
    await context.router.replace(const DeciderRoute());
  }
}
