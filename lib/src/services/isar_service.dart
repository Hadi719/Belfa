import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:logging/logging.dart';
import 'package:path_provider/path_provider.dart';

import '../model/app_settings.dart';
import '../model/db/group.dart';
import '../model/db/installment.dart';
import '../model/db/loan.dart';
import '../model/db/member.dart';
import '../utils/usecase/pick_file_or_directory.dart';

Logger log = Logger('main.services.isar');
const String isarDbName = 'Apcha_isar_database';

/// Service for managing the Isar database.
class IsarService extends GetxService {
  late final Isar isar;

  /// Initializes the Isar database.
  ///
  /// Opens the database with the specified schemas and directory.
  /// Returns a [Future] that completes with this [IsarService] instance.
  Future<IsarService> init() async {
    log.info('Initializing Isar database...');

    try {
      final dir = await getApplicationDocumentsDirectory();
      isar = await Isar.open(
        [
          GroupSchema,
          MemberSchema,
          LoanSchema,
          InstallmentSchema,
          AppSettingsSchema,
        ],
        directory: dir.path,
        name: isarDbName,
      );

      log.info('Isar database initialized.');
    } catch (e) {
      log.severe('Failed to initialize Isar database: $e', [e]);
      rethrow;
    }

    return this;
  }

  /// Restores the Isar database from a backup file.
  ///
  /// Returns `true` if the restore was successful, `false` if the user
  /// cancels the file selection.
  Future<bool> restoreFromBackup() async {
    log.info('Restoring database from backup...');

    try {
      // 1. Prompt user to select backup file
      final backupFilePath = await pickIsarFile();
      if (backupFilePath == null) {
        log.warning('Restoring database canceled by user.');
        return false;
      }

      // 2. Close existing Isar instance
      await close();

      // 3. Get the path to the current database file
      final directory = await getApplicationDocumentsDirectory();
      final databasePath = '${directory.path}/$isarDbName.isar';

      // 4. Copy the backup file, overwriting the existing database file
      final backupFile = File(backupFilePath);
      await backupFile.copy(databasePath);

      // 5. Reopen Isar
      await init();

      log.info('Database restored from backup: $backupFilePath');
    } catch (e) {
      log.severe('Error restoring database from backup: $e', [e]);
      rethrow;
    }

    return true;
  }

  /// Creates a backup of the Isar database in a user-selected directory.
  ///
  /// Returns the path to the backup file if the backup was successful.
  /// Throws an exception if an error occurs during the backup process.
  Future<String> createBackup() async {
    log.info('Creating database backup...');

    try {
      final directory = await getApplicationDocumentsDirectory();
      final databasePath = '${directory.path}/$isarDbName.isar';
      final databaseFile = File(databasePath);

      if (!await databaseFile.exists()) {
        const message = 'Database file not found.';
        log.warning(message);
        throw Exception(message);
      }

      String? selectedDirectory = await selectDirectory();
      if (selectedDirectory == null) {
        throw Exception('No directory selected for backup.');
      }

      final backupFileName =
          'Apcha_isar_database_backup_${DateTime.now().toIso8601String()}.isar';
      final backupFilePath = '$selectedDirectory/$backupFileName';

      await databaseFile.copy(backupFilePath);

      log.info('Database backed up to: $backupFilePath');
      return backupFilePath;
    } catch (e) {
      log.severe('Error creating database backup: $e', [e]);
      rethrow;
    }
  }

  /// Clears all data from all collections in the database.
  Future<void> clearAllData() async {
    log.info('Clearing all data...');

    try {
      await isar.writeTxn(() async {
        await isar.groups.clear();
        await isar.members.clear();
        await isar.loans.clear();
        await isar.installments.clear();
        await isar.appSettings.clear();
      });

      log.info('All data cleared.');
    } catch (e) {
      log.severe('Error clearing all data: $e', [e]);
      rethrow;
    }
  }

  /// Closes the Isar database connection.
  ///
  /// Returns a [Future] that completes with `true` if the database was
  /// closed successfully, `false` otherwise.
  Future<bool> close() async {
    log.info('Closing Isar database...');

    try {
      final isSuccess = await isar.close();

      if (isSuccess) {
        log.info('Isar database closed.');
      } else {
        log.warning('Isar database close returned false.');
      }

      return isSuccess;
    } catch (e) {
      log.severe('Error closing Isar database: $e', [e]);
      rethrow;
    }
  }
}
