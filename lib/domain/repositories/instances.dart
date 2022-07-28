import 'package:isar/isar.dart';
import 'package:tankobon/api/models/token.dart';
import 'package:tankobon/domain/collections/instance.dart';
import 'package:tankobon/domain/instances/isar.dart';
import 'package:tankobon/domain/repositories/current_instance.dart';

Future<List<Instance?>> getTokenListRepository() async {
  return IsarClient().isar.instances.where().findAll();
}

Future<Instance?> getTokenRepository(String? instanceId) async {
  return IsarClient()
      .isar
      .instances
      .filter()
      .instanceIdEqualTo(
        instanceId ?? await getCurrentInstanceRepository(),
      )
      .findFirst();
}

Future<void> addTokenRepository(Token token, String url) async {
  final instance = Instance()
    ..url = url
    ..instanceId = token.instanceId
    ..accessToken = token.accessToken
    ..refreshToken = token.refreshToken;

  await IsarClient().isar.writeTxn(() async {
    instance.id = await IsarClient().isar.instances.put(instance);
  });
}

Future<void> delTokenRepository(String instanceId) async {
  await IsarClient().isar.writeTxn(() async {
    await IsarClient()
        .isar
        .instances
        .filter()
        .instanceIdEqualTo(instanceId)
        .deleteAll();
  });
}
