import "package:tankobon/api/models/user.dart";
import "package:tankobon/domain/service/http.dart";

Future<User> getMe() async {
  final response = await getHttp("/user/me");

  return User.fromJson(response.data as Map<String, dynamic>);
}
