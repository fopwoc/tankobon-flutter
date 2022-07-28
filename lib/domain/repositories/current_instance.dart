import 'package:flutter/material.dart';
import 'package:tankobon/domain/collections/current_instance.dart';
import 'package:tankobon/domain/instances/isar.dart';

Future<String> getCurrentInstanceRepository() async {
  final result = await IsarClient().isar.currentInstances.get(0);
  if (result == null) throw FlutterError('message');
  return result.instanceId;
}

Future<void> setCurrentInstanceRepository(String? instanceId) async {
  if (instanceId == null) {
    await IsarClient().isar.writeTxn(() async {
      await IsarClient().isar.currentInstances.clear();
    });
    return;
  }

  final instance = CurrentInstance()
    ..id = 0
    ..instanceId = instanceId;

  await IsarClient().isar.writeTxn(() async {
    instance.id = await IsarClient().isar.currentInstances.put(instance);
  });
}
