import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:logging/logging.dart';

import '../model/db/loan.dart';
import '../services/isar_service.dart';
import '../utils/usecase/try_method.dart';

Logger log = Logger('main.repository.loan');

class LoanRepository {
  late IsarCollection<Loan> loans;

  late Isar _isar;

  LoanRepository init() {
    try {
      log.info('loan repository init started...');

      _isar = Get.find<IsarService>().isar;
      loans = _isar.loans;

      log.info('loan repository init completed');
      return this;
    } catch (e) {
      log.severe('Failed to initialize loan repository', [e]);
      rethrow;
    }
  }

  /// Inserts/updates a loan
  Future<Id> insertloan(Loan data) async {
    return tryMethod<Id>(
      method: () async {
        late Id id;
        await _isar.writeTxn(() async {
          id = await loans.put(data);
        });
        return id;
      },
      log: log,
      message: 'Insert loan',
    );
  }

  /// Inserts/updates list of loans
  Future<List<Id>> insertloans(List<Loan> data) async {
    return tryMethod<List<Id>>(
      method: () async {
        List<Id> ids = <Id>[];
        await _isar.writeTxn(() async {
          ids.addAll(await loans.putAll(data));
        });
        return ids;
      },
      log: log,
      message: 'Insert loans',
      extraMessage: '==> ${data.length} out of ${data.length} was successful',
    );
  }

  /// Deletes a loan
  Future<bool> deleteloan(Id id) async {
    return tryMethod<bool>(
      method: () async {
        bool success = false;
        await _isar.writeTxn(() async {
          success = await loans.delete(id);
        });
        return success;
      },
      log: log,
      message: 'Delete loan (id: $id)',
    );
  }

  /// Deletes loans
  Future<int> deleteloans(List<Id> ids) async {
    return tryMethod<int>(
      method: () async {
        int count = 0;
        await _isar.writeTxn(() async {
          count = await loans.deleteAll(ids);
        });
        return count;
      },
      log: log,
      message: 'Delete loans',
      extraMessage: '==> ${ids.length} out of ${ids.length} was successful',
    );
  }

  /// Finds loan by id
  Future<Loan?> findloanById(Id id) async {
    return tryMethod<Loan?>(
      method: () async {
        return await loans.get(id);
      },
      log: log,
      message: 'Find loan by id',
    );
  }

  /// Gets all loans
  Future<List<Loan>> getAllloans() async {
    return tryMethod<List<Loan>>(
      method: () async {
        return await loans.where().findAll();
      },
      log: log,
      message: 'get all loans',
    );
  }
}
