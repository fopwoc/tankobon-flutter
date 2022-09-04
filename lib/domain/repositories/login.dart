import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:tankobon/api/services/login.dart';
import 'package:tankobon/domain/database/current_instance.dart';
import 'package:tankobon/domain/database/instances.dart';
import 'package:tankobon/domain/models/login.dart';
import 'package:tankobon/domain/state/global_state.dart';

Future<void> loginInRepository(
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

Future<void> loginOutRepository(
  BuildContext context,
) async {
  await delInstance(await getCurrentInstance());
  await setCurrentInstance(null);
  Provider.of<GlobalState>(
    context,
    listen: false,
  ).setGlobalState(null);
}
