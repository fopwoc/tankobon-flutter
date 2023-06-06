import "package:isar/isar.dart";

part "current_instance.g.dart";

@Collection()
class CurrentInstance {
  late Id id;
  @Index(unique: true)
  late String instanceId;
}
