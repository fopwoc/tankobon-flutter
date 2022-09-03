import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tankobon/domain/collections/current_instance.dart';
import 'package:tankobon/domain/collections/instance.dart';

class IsarProvider {
  static late Isar isar;

  static Future<void> init() async {
    final isarPath = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [
        InstanceSchema,
        CurrentInstanceSchema,
      ],
      directory: isarPath.path,
    );
  }

  static Future<void> close() async => isar.close();
}
