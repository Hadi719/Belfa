import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:path_provider/path_provider.dart';

/// Handles application logging to a file with log rotation.
class AppLogHandler {
  // Directory where log files will be stored.
  late final Directory _logDirectory;
  // The current log file.
  late File _logFile;
  // Maximum log file size in bytes (e.g., 10MB).
  final int _maxLogFileSize = 10 * 1024 * 1024;
  // Maximum number of log files to keep.
  final int _maxLogFiles = 5;

  /// Initializes the log handler.
  ///
  /// Gets the application documents directory, creates the log file,
  /// and performs initial log rotation.
  Future<AppLogHandler> init() async {
    _logDirectory = await getApplicationDocumentsDirectory();
    await _rotateLogs();
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
  /// Performs log rotation if the current log file exceeds the maximum size.
  void _writeLogToFile(LogRecord record) async {
    final logMessage =
        '${DateTime.now()}: ${record.level.name}: ${record.message}\n stacktrace: ${record.stackTrace}\n';
    await _logFile.writeAsString(logMessage, mode: FileMode.append);

    // Check for log rotation after writing.
    if (await _logFile.length() > _maxLogFileSize) {
      await _rotateLogs();
    }
  }

  /// Rotates log files.
  ///
  /// Renames existing log files (e.g., log.txt becomes log_1.txt)
  /// and creates a new log.txt file. Deletes older log files
  /// if the maximum number of files is exceeded.
  Future<void> _rotateLogs() async {
    for (int i = _maxLogFiles - 1; i > 0; i--) {
      final oldLogFile = File('${_logDirectory.path}/log_$i.txt');
      final newLogFile = File('${_logDirectory.path}/log_${i + 1}.txt');

      if (await oldLogFile.exists()) {
        await oldLogFile.rename(newLogFile.path);
      }
    }

    final oldLogFile = File('${_logDirectory.path}/log.txt');
    if (await oldLogFile.exists()) {
      await oldLogFile.rename('${_logDirectory.path}/log_1.txt');
    }

    _logFile = File('${_logDirectory.path}/log.txt');
  }
}
