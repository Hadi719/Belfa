import 'dart:async';

import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:logging/logging.dart';
import 'package:path_provider/path_provider.dart';

import '../model/db/group.dart';
import '../model/db/installment.dart';
import '../model/db/loan.dart';
import '../model/db/member.dart';
import '../model/my_app_settings.dart';

Logger log = Logger('main.services.isar');

/// Service class for managing the Isar database.
class IsarService extends GetxService {
  late final Isar isar;

  /// Initializes the Isar database.
  ///
  /// Opens the database with the specified schemas and directory.
  /// Returns a [Future] that completes with this [IsarService] instance.
  Future<IsarService> init() async {
    log.info('Isar init started...');

    try {
      final dir = await getApplicationDocumentsDirectory();
      isar = await Isar.open(
        [
          GroupSchema,
          MemberSchema,
          LoanSchema,
          InstallmentSchema,
          MyAppSettingsSchema,
        ],
        directory: dir.path,
      );
      log.info('Isar init completed');
      return this;
    } catch (e) {
      log.severe('Failed to open Isar', [e]);
      rethrow;
    }
  }

  /// Clears all data from all collections in the database.
  ///
  /// Executes a write transaction to clear the following collections:
  /// - groups
  /// - members
  /// - loans
  /// - installments
  /// - myAppSettings
  void clearAllCollectionData() async {
    log.info('Isar clear all collection data started...');

    try {
      await isar.writeTxnSync(() async {
        await isar.groups.clear();
        await isar.members.clear();
        await isar.loans.clear();
        await isar.installments.clear();
        await isar.myAppSettings.clear();
      });

      log.info('Isar clear all collection data completed');
    } catch (e) {
      log.severe('Isar clear all collection data failed', [e]);
      rethrow;
    }
  }

  /// Closes the Isar database connection.
  ///
  /// Returns a [Future] that completes with `true` if the database was
  /// closed successfully, `false` otherwise.
  Future<bool> close() async {
    log.info('Closing Isar started...');
    try {
      final isSuccess = await isar.close();
      if (isSuccess) {
        log.info('Isar closed successfully');
      } else {
        log.warning('Isar close returned false');
      }
      return Future.value(isSuccess);
    } catch (e) {
      log.severe('Closing Isar failed', [e]);
      rethrow;
    }
  }
}
