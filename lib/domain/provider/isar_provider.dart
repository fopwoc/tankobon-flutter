import "package:isar/isar.dart";
import "package:path_provider/path_provider.dart";
import "package:tankobon/domain/collections/current_instance.dart";
import "package:tankobon/domain/collections/instance.dart";

class IsarProvider {
  IsarProvider._();

  static late Isar isar;

  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [
        InstanceSchema,
        CurrentInstanceSchema,
      ],
      directory: dir.path,
    );
  }

  static void close() => isar.close();

  static Future<void> clear() async {
    await isar.writeTxn(() async {
      await isar.clear();
    });
  }
}
