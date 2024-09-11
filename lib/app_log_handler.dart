import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:path_provider/path_provider.dart';

/// Handles application logging to a file.
class AppLogHandler {
  // Directory where the log file will be stored.
  late final Directory _logDirectory;
  // The log file.
  late final File _logFile;

  /// Initializes the log handler.
  ///
  /// Gets the application documents directory and creates the log file.
  Future<AppLogHandler> init() async {
    _logDirectory = await getApplicationDocumentsDirectory();
    _logFile = File('${_logDirectory.path}/log.txt');
    return this;
  }

  /// Configures the logging behavior.
  ///
  /// In debug mode, logs all messages to the console.
  /// In release mode, logs warnings and errors to the log file.
  Future<void> configureLogging() async {
    if (kDebugMode) {
      Logger.root.level = Level.ALL;
      Logger.root.onRecord.listen((record) {
        debugPrint('${record.level.name}: ${record.time}: ${record.message}');
      });
    } else {
      Logger.root.level = Level.WARNING;
      Logger.root.onRecord.listen(_writeLogToFile);
    }
  }

  /// Writes a log record to the log file.
  ///
  /// Includes timestamp, log level, message, and stack trace (if available).
  void _writeLogToFile(LogRecord record) async {
    final logMessage =
        '${DateTime.now()}: ${record.level.name}: ${record.message}\n stacktrace: ${record.stackTrace}\n';
    _logFile.writeAsStringSync(logMessage, mode: FileMode.append);
  }
}
