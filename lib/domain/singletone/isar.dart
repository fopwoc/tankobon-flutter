import 'package:isar/isar.dart';
import 'package:tankobon/domain/collections/current_instance.dart';
import 'package:tankobon/domain/collections/instance.dart';

class IsarProvider {
  static late Isar isar;

  static Future<void> init() async {
    isar = await Isar.open(
      [
        InstanceSchema,
        CurrentInstanceSchema,
      ],
    );
  }

  static Future<void> close() async => isar.close();

  static Future<void> clear() async {
    await isar.writeTxn(() async {
      await isar.clear();
    });
  }
}
