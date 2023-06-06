import "package:flutter/foundation.dart";
import "package:logging/logging.dart";

class LoggerProvider {
  LoggerProvider._();

  static late Logger log;

  static void init() {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) {
      if (kDebugMode) {
        print("${record.level.name}: ${record.time}: ${record.message}");
      }
      // TODO: write to file
    });

    log = Logger("Logger");
  }

  static void info(Object? object) {
    log.info("$object");
  }

  static void warning(Object? object, [Object? error, StackTrace? stackTrace]) {
    log.warning("$object", error, stackTrace);
  }

  static void fine(Object? object) {
    log.fine("$object");
  }
}
