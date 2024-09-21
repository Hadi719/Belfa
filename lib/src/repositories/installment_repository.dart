import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:logging/logging.dart';

import '../models/db/installment.dart';
import '../services/isar_service.dart';
import '../utils/usecase/execute_and_log.dart';

Logger log = Logger('repository.installment');

/// Repository for managing [Installment] entities in the Isar database.
class InstallmentRepository {
  /// Isar collection for accessing [Installment] entities.
  late IsarCollection<Installment> installments;

  late Isar _isar;

  /// Initializes the repository by obtaining a reference to the [Isar] instance
  /// and the [installments] collection.
  InstallmentRepository init() {
    log.info('Initializing InstallmentRepository...');

    try {
      _isar = Get.find<IsarService>().isar;
      installments = _isar.installments;

      log.info('InstallmentRepository initialized.');
    } catch (e) {
      log.severe('Failed to initialize InstallmentRepository: $e', [e]);
      rethrow;
    }

    return this;
  }

  /// Inserts or updates an [Installment] entity.
  Future<Id> insertInstallment(Installment installment) async {
    return executeAndLog<Id>(
      method: () => _isar.writeTxn(() => installments.put(installment)),
      logger: log,
      taskDescription: 'Insert installment',
      extraMessageBuilder: (id) => 'Inserted installment with ID: $id.',
    );
  }

  /// Inserts or updates a list of [Installment] entities.
  Future<List<Id>> insertInstallments(List<Installment> installments) async {
    return executeAndLog<List<Id>>(
      method: () =>
          _isar.writeTxn(() => this.installments.putAll(installments)),
      logger: log,
      taskDescription: 'Insert installments',
      extraMessageBuilder: (ids) =>
          'Inserted ${ids.length} out of ${installments.length} installments successfully.',
    );
  }

  /// Deletes an [Installment] entity by its ID.
  Future<bool> deleteInstallment(Id id) async {
    return executeAndLog<bool>(
      method: () => _isar.writeTxn(() => installments.delete(id)),
      logger: log,
      taskDescription: 'Delete installment',
      extraMessageBuilder: (success) => success
          ? 'Installment with ID: $id deleted successfully.'
          : 'Failed to delete installment with ID: $id.',
    );
  }

  /// Deletes multiple [Installment] entities by their IDs.
  Future<int> deleteInstallments(List<Id> ids) async {
    return executeAndLog<int>(
      method: () => _isar.writeTxn(() => installments.deleteAll(ids)),
      logger: log,
      taskDescription: 'Delete installments',
      extraMessageBuilder: (count) =>
          'Deleted $count out of ${ids.length} installments successfully.',
    );
  }

  /// Finds an [Installment] entity by its ID.
  Future<Installment?> findInstallmentById(Id id) async {
    return executeAndLog<Installment?>(
      method: () => installments.get(id),
      logger: log,
      taskDescription: 'Find installment by ID',
    );
  }

  /// Retrieves all [Installment] entities from the database.
  Future<List<Installment>> getAllInstallments() async {
    return executeAndLog<List<Installment>>(
      method: () => installments.where().findAll(),
      logger: log,
      taskDescription: 'Get all installments',
      extraMessageBuilder: (installments) =>
          'Retrieved ${installments.length} installments.',
    );
  }
}
