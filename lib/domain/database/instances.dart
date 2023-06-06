import "package:isar/isar.dart";
import "package:tankobon/api/models/token.dart";
import "package:tankobon/domain/collections/instance.dart";
import "package:tankobon/domain/database/current_instance.dart";
import "package:tankobon/domain/exception/model/common_exception.dart";
import "package:tankobon/domain/provider/isar_provider.dart";
import "package:tankobon/domain/provider/logger_provider.dart";

final schemaName = InstanceSchema.name;

Future<List<Instance>> getInstanceList() async {
  final result = IsarProvider.isar.instances.where().findAll();
  LoggerProvider.fine("ISAR get -> $schemaName ${await result}");

  return result;
}

Future<Instance> getInstance(String? instanceId) async {
  final instance = await IsarProvider.isar.instances
      .filter()
      .instanceIdEqualTo(
        instanceId ?? await getCurrentInstance(),
      )
      .findFirst();

  LoggerProvider.fine("ISAR get -> $schemaName $instanceId $instance");
  if (instance == null) throw CommonException("cant find instance");

  return instance;
}

Future<void> addInstance(Token token, String url) async {
  LoggerProvider.fine("ISAR add <- $schemaName $url");

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
  LoggerProvider.fine("ISAR update <- $schemaName $instanceId");

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
  LoggerProvider.fine("ISAR delete <- $schemaName");

  await IsarProvider.isar.writeTxn(() async {
    await IsarProvider.isar.instances
        .filter()
        .instanceIdEqualTo(
          instanceId,
        )
        .deleteAll();
  });
}
