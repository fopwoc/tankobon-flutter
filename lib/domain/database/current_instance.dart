import 'package:flutter/material.dart';
import 'package:tankobon/domain/collections/current_instance.dart';
import 'package:tankobon/domain/singletone/isar.dart';

Future<String> getCurrentInstance() async {
  final result = await IsarProvider.isar.currentInstances.get(0);
  if (result == null) throw FlutterError('message');
  return result.instanceId;
}

Future<void> setCurrentInstance(String? instanceId) async {
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
