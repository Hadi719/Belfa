import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:logging/logging.dart';

import '../models/isar/installment.dart';
import '../services/isar_service.dart';
import '../utils/usecase/execute_and_log.dart';
import 'base/collection_repository.dart';

Logger _log = Logger('repository.installment');

/// Repository for managing [Installment] entities in the Isar database.
class InstallmentRepository extends CollectionRepository<Installment> {
  /// Isar collection for accessing [Installment] entities.
  @override
  IsarCollection<Installment> get collection => _isar.installments;

  late Isar _isar;

  /// Initializes the repository by obtaining a reference to the [Isar] instance
  /// and the [collection] collection.
  InstallmentRepository init() {
    _log.info('Initializing InstallmentRepository...');

    try {
      _isar = Get.find<IsarService>().isar;
      collection = _isar.installments;

      _log.info('InstallmentRepository initialized.');
    } catch (e) {
      _log.severe('Failed to initialize InstallmentRepository: $e', [e]);
      rethrow;
    }

    return this;
  }

  /// Inserts or updates an [Installment] entity.
  @override
  Future<Id> insertObject(Installment installment) async {
    return executeAndLog<Id>(
      method: () => _isar.writeTxnSync(() => collection.putSync(installment)),
      logger: _log,
      taskDescription: 'Insert installment',
      extraMessageBuilder: (id) => 'Inserted installment with ID: $id.',
    );
  }

  /// Inserts or updates a list of [Installment] entities.
  @override
  Future<List<Id>> insertObjects(List<Installment> installments) async {
    return executeAndLog<List<Id>>(
      method: () =>
          _isar.writeTxnSync(() => collection.putAllSync(installments)),
      logger: _log,
      taskDescription: 'Insert installments',
      extraMessageBuilder: (ids) =>
          'Inserted ${ids.length} out of ${installments.length} installments successfully.',
    );
  }

  /// Deletes an [Installment] entity by its ID.
  @override
  Future<bool> deleteObject(Id id) async {
    return executeAndLog<bool>(
      method: () => _isar.writeTxn(() => collection.delete(id)),
      logger: _log,
      taskDescription: 'Delete installment',
      extraMessageBuilder: (success) => success
          ? 'Installment with ID: $id deleted successfully.'
          : 'Failed to delete installment with ID: $id.',
    );
  }

  /// Deletes multiple [Installment] entities by their IDs.
  @override
  Future<Id> deleteObjects(List<Id> ids) async {
    return executeAndLog<Id>(
      method: () => _isar.writeTxn(() => collection.deleteAll(ids)),
      logger: _log,
      taskDescription: 'Delete installments',
      extraMessageBuilder: (count) =>
          'Deleted $count out of ${ids.length} installments successfully.',
    );
  }

  /// Finds an [Installment] entity by its ID.
  @override
  Future<Installment?> findObjectById(Id id) async {
    return executeAndLog<Installment?>(
      method: () => collection.get(id),
      logger: _log,
      taskDescription: 'Find installment by ID',
    );
  }

  /// Retrieves all [Installment] entities from the database.
  @override
  Future<List<Installment>> getAllObjects() async {
    return executeAndLog<List<Installment>>(
      method: () => collection.where().findAll(),
      logger: _log,
      taskDescription: 'Get all installments',
      extraMessageBuilder: (installments) =>
          'Retrieved ${installments.length} installments.',
    );
  }
}
