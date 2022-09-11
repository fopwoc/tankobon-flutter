import 'package:http/http.dart';

class HttpProvider {
  static late Client http;

  static Future<void> init() async => http = Client();

  static Future<void> close() async => http.close();
}
