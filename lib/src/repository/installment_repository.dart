import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:logging/logging.dart';

import '../model/db/installment.dart';
import '../services/isar_service.dart';
import '../utils/usecase/try_method.dart';

Logger log = Logger('main.repository.installment');

class InstallmentRepository {
  late IsarCollection<Installment> installments;

  late Isar _isar;

  InstallmentRepository init() {
    try {
      log.info('Installment repository init started...');

      _isar = Get.find<IsarService>().isar;
      installments = _isar.installments;

      log.info('Installment repository init completed');
      return this;
    } catch (e) {
      log.severe('Failed to initialize Installment repository', [e]);
      rethrow;
    }
  }

  /// Inserts/updates a installment
  Future<Id> insertInstallment(Installment data) async {
    return tryMethod<Id>(
      method: () async {
        late Id id;
        await _isar.writeTxn(() async {
          id = await installments.put(data);
        });
        return id;
      },
      log: log,
      message: 'Insert installment',
    );
  }

  /// Inserts/updates list of installments
  Future<List<Id>> insertInstallments(List<Installment> data) async {
    return tryMethod<List<Id>>(
      method: () async {
        List<Id> ids = <Id>[];
        await _isar.writeTxn(() async {
          ids.addAll(await installments.putAll(data));
        });
        return ids;
      },
      log: log,
      message: 'Insert installments',
      extraMessage: '==> ${data.length} out of ${data.length} was successful',
    );
  }

  /// Deletes a installment
  Future<bool> deleteInstallment(Id id) async {
    return tryMethod<bool>(
      method: () async {
        bool success = false;
        await _isar.writeTxn(() async {
          success = await installments.delete(id);
        });
        return success;
      },
      log: log,
      message: 'Delete installment (id: $id)',
    );
  }

  /// Deletes installments
  Future<int> deleteInstallments(List<Id> ids) async {
    return tryMethod<int>(
      method: () async {
        int count = 0;
        await _isar.writeTxn(() async {
          count = await installments.deleteAll(ids);
        });
        return count;
      },
      log: log,
      message: 'Delete installments',
      extraMessage: '==> ${ids.length} out of ${ids.length} was successful',
    );
  }

  /// Finds installment by id
  Future<Installment?> findInstallmentById(Id id) async {
    return tryMethod<Installment?>(
      method: () async {
        return await installments.get(id);
      },
      log: log,
      message: 'Find installment by id',
    );
  }

  /// Gets all installments
  Future<List<Installment>> getAllInstallments() async {
    return tryMethod<List<Installment>>(
      method: () async {
        return await installments.where().findAll();
      },
      log: log,
      message: 'get all installments',
    );
  }
}
