import 'package:isar/isar.dart';

part 'instance.g.dart';

@Collection()
class Instance {
  Id id = Isar.autoIncrement;
  @Index(unique: true)
  late String instanceId;
  late String url;
  late String accessToken;
  late String refreshToken;
}
