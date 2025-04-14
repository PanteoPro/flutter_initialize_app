import 'package:logging/logging.dart';

class AppLogger {
  static final _rootLogger = Logger('App');
  static bool _initialized = false;

  static void initialize() {
    if (_initialized) return;
    _initialized = true;

    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) {
      final message =
          '${record.time}: ${record.level.name}: ${record.loggerName}: ${record.message}';

      if (record.error != null) {
        print(
            '$message\nError: ${record.error}\nStack trace:\n${record.stackTrace}');
      } else {
        print(message);
      }
    });
  }

  static Logger get root => _rootLogger;

  static Logger getLogger(String name) {
    return Logger('${_rootLogger.name}.$name');
  }
}
