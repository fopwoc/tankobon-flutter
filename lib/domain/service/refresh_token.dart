import 'package:tankobon/api/services/login.dart';
import 'package:tankobon/domain/database/instances.dart';

Future<String> refreshToken({String? instanceId}) async {
  final newToken = await refresh(instanceId);
  await updateInstance(newToken, instanceId);
  return newToken.accessToken;
}
