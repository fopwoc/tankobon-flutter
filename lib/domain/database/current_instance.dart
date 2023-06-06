import "package:flutter/material.dart";
import "package:tankobon/domain/collections/current_instance.dart";
import "package:tankobon/domain/provider/isar_provider.dart";
import "package:tankobon/domain/provider/logger_provider.dart";

final schemaName = CurrentInstanceSchema.name;

Future<String> getCurrentInstance() async {
  final result = await IsarProvider.isar.currentInstances.get(0);
  if (result == null) throw FlutterError("message");
  LoggerProvider.fine("ISAR get -> $schemaName ${result.instanceId}");

  return result.instanceId;
}

Future<void> setCurrentInstance(String? instanceId) async {
  LoggerProvider.fine("ISAR set <- $schemaName $instanceId");

  if (instanceId == null) {
    await IsarProvider.isar.writeTxn(() async {
      await IsarProvider.isar.currentInstances.clear();
    });

    return;
  }

  final instance = CurrentInstance()
    ..id = 0
    ..instanceId = instanceId;

  await IsarProvider.isar.writeTxn(() async {
    instance.id = await IsarProvider.isar.currentInstances.put(instance);
  });
}
