import 'dart:async';

import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:logging/logging.dart';
import 'package:path_provider/path_provider.dart';

import '../model/group.dart';
import '../model/installment.dart';
import '../model/loan.dart';
import '../model/member.dart';

Logger log = Logger('main.services.isar');

class IsarService extends GetxService {
  late Isar _isar;

  Isar get isar => _isar;

  IsarCollection<Group> get groupsCollection => _isar.groups;
  IsarCollection<Member> get membersCollection => _isar.members;
  IsarCollection<Loan> get loansCollection => _isar.loans;
  IsarCollection<Installment> get installmentsCollection => _isar.installments;

  Future<void> init() async {
    try {
      log.info('Isar init started...');

      final dir = await getApplicationDocumentsDirectory();
      final Isar isar = await Isar.open(
        [
          GroupSchema,
          MemberSchema,
          LoanSchema,
          InstallmentSchema,
        ],
        directory: dir.path,
      );
      _isar = isar;
      log.info('Isar init completed');
    } catch (e) {
      log.severe('Failed to open Isar', [e]);
      rethrow;
    }
  }

  /// Create or update an object
  Future<Id> putData<T>(T data) async {
    try {
      log.info('Isar putData started...');

      late Id id;

      await _isar.writeTxnSync(() async {
        id = _isar.collection<T>().putSync(data);
      });

      log.info('Isar putData completed');
      return Future.value(id);
    } catch (e) {
      log.severe('Isar putData failed', [e]);
      return Future.error(e);
    }
  }

  /// Create or update objects
  Future<List<Id>> putList<T>(List<T> datas) async {
    try {
      log.info('Isar putList started...');

      List<Id> ids = <Id>[];

      await _isar.writeTxnSync(() async {
        ids = _isar.collection<T>().putAllSync(datas);
      });

      log.info('Isar putList completed');
      return Future.value(ids);
    } catch (e) {
      log.severe('Isar putList failed', [e]);
      return Future.error(e);
    }
  }

  /// Delete an object
  Future<bool> deleteData<T>(Id id) async {
    bool success = false;
    try {
      log.info('Isar deleteData(id: $id) started...');

      await _isar.writeTxnSync(() async {
        success = _isar.collection<T>().deleteSync(id);
      });

      log.info('Isar deleteData(id: $id) completed');
      return Future.value(success);
    } catch (e) {
      log.severe('Isar deleteData(id: $id) failed', [e]);
      return false;
    }
  }

  /// Delete objects
  Future<int> deleteList<T>(List<Id> ids) async {
    int count = 0;
    try {
      log.info('Isar deleteList started...');
      await _isar.writeTxnSync(() async {
        count = _isar.collection<T>().deleteAllSync(ids);
      });

      log.info('Isar deleteList completed');
      return Future.value(count);
    } catch (e) {
      log.severe('Isar deleteList failed', [e]);
      return Future.error(e);
    }
  }

  /// Get object by id
  Future<T?> getData<T>(Id id) async {
    try {
      log.info('Isar getData started...');

      final T? data = await _isar.collection<T>().get(id);

      log.info('Isar getData completed');
      return Future.value(data);
    } catch (e) {
      log.severe('Isar getData failed', [e]);
      return Future.error(e);
    }
  }

  /// Get all objects
  Future<List<T>> getAllData<T>() async {
    try {
      log.info('Isar getAllData started...');

      final List<T> data = await _isar.collection<T>().where().findAll();

      log.info('Isar getAllData completed');
      return Future.value(data);
    } catch (e) {
      log.severe('Isar getAllData failed', [e]);
      return Future.error(e);
    }
  }

  /// Clear all collection data
  void clearAllCollectionData() async {
    try {
      log.info('Isar clear all collection data started...');

      await _isar.writeTxnSync(() async {
        await _isar.groups.clear();
        await _isar.members.clear();
        await _isar.loans.clear();
        await _isar.installments.clear();
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

      await _isar.writeTxnSync(() async {
        isSuccess = await _isar.close();
      });

      log.info('Isar closed successfuly');
      return Future.value(isSuccess);
    } catch (e) {
      log.severe('Closing Isar failed', [e]);
      rethrow;
    }
  }
}
