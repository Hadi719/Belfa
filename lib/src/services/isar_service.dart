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

class IsarService extends GetxService {
  late final Isar isar;

  Future<IsarService> init() async {
    try {
      log.info('Isar init started...');

      final dir = await getApplicationDocumentsDirectory();
      // Note: add new collection schema here
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

  /// Clear all collection data
  void clearAllCollectionData() async {
    try {
      log.info('Isar clear all collection data started...');

      // Note: Clear new collection
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

  /// Close Isar connection
  Future<bool> close() async {
    try {
      log.info('Closing Isar started...');

      bool isSuccess = false;

      await isar.writeTxnSync(() async {
        isSuccess = await isar.close();
      });

      log.info('Isar closed successfuly');
      return Future.value(isSuccess);
    } catch (e) {
      log.severe('Closing Isar failed', [e]);
      rethrow;
    }
  }
}
