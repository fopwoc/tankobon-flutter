import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:tankobon/api/services/login.dart';
import 'package:tankobon/domain/database/current_instance.dart';
import 'package:tankobon/domain/database/instances.dart';
import 'package:tankobon/domain/models/login.dart';
import 'package:tankobon/domain/state/global_state.dart';

Future<void> loginIn(
  BuildContext context,
  LoginPayload payload,
) async {
  final token = await login(payload);
  await addInstance(token, payload.instance);
  await setCurrentInstance(token.instanceId);

  Provider.of<GlobalState>(
    context,
    listen: false,
  ).setGlobalState(token.instanceId);
}

Future<void> loginOut(
  BuildContext context, {
  String? instance,
}) async {
  await delInstance(instance ?? await getCurrentInstance());
  final newInstance = (await getInstanceList()).firstOrNull?.instanceId;
  await setCurrentInstance(newInstance);
  Provider.of<GlobalState>(
    context,
    listen: false,
  ).setGlobalState(newInstance);
}
