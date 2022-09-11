import 'package:isar/isar.dart';
import 'package:tankobon/api/models/token.dart';
import 'package:tankobon/domain/collections/instance.dart';
import 'package:tankobon/domain/database/current_instance.dart';
import 'package:tankobon/domain/exception/type/common.dart';
import 'package:tankobon/domain/singleton/isar.dart';

Future<List<Instance>> getInstanceList() async {
  return IsarProvider.isar.instances.where().findAll();
}

Future<Instance> getInstance(String? instanceId) async {
  final instance = await IsarProvider.isar.instances
      .filter()
      .instanceIdEqualTo(
        instanceId ?? await getCurrentInstance(),
      )
      .findFirst();

  if (instance == null) throw CommonException('cant find instance');
  return instance;
}

Future<void> addInstance(Token token, String url) async {
  final instance = Instance()
    ..url = url
    ..instanceId = token.instanceId
    ..accessToken = token.accessToken
    ..refreshToken = token.refreshToken;

  await IsarProvider.isar.writeTxn(() async {
    instance.id = await IsarProvider.isar.instances.put(instance);
  });
}

Future<void> updateInstance(Token token, String? instanceId) async {
  final oldInstance = await getInstance(instanceId);
  final newInstance = oldInstance
    ..instanceId = token.instanceId
    ..accessToken = token.accessToken
    ..refreshToken = token.refreshToken;

  await IsarProvider.isar.writeTxn(() async {
    oldInstance.id = await IsarProvider.isar.instances.put(newInstance);
  });
}

Future<void> delInstance(String instanceId) async {
  await IsarProvider.isar.writeTxn(() async {
    await IsarProvider.isar.instances
        .filter()
        .instanceIdEqualTo(
          instanceId,
        )
        .deleteAll();
  });
}
