import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:logging/logging.dart';

import '../models/isar/loan.dart';
import '../services/isar_service.dart';
import '../utils/usecase/execute_and_log.dart';
import 'base/collection_repository.dart';

Logger _log = Logger('repository.loan');

/// Repository for managing [Loan] entities in the Isar database.
class LoanRepository extends CollectionRepository<Loan> {
  /// Isar collection for accessing [Loan] entities.
  @override
  IsarCollection<Loan> get collection => _isar.loans;

  late Isar _isar;

  /// Initializes the repository by obtaining a reference to the [Isar] instance
  /// and the [collection] collection.
  LoanRepository init() {
    _log.info('Initializing LoanRepository...');

    try {
      _isar = Get.find<IsarService>().isar;
      collection = _isar.loans;

      _log.info('LoanRepository initialized.');
    } catch (e) {
      _log.severe('Failed to initialize LoanRepository: $e', [e]);
      rethrow;
    }

    return this;
  }

  /// Creates or updates a [Loan] entity.
  @override
  Future<Id> insertObject(Loan loan) async {
    return executeAndLog<Id>(
      // Todo: check if [IsarLink] updates when a link removed.
      // if [saveSync] doesn't work, check [reset] first;
      method: () => _isar.writeTxnSync(() => collection.putSync(loan)),
      logger: _log,
      taskDescription: 'Insert loan',
      extraMessageBuilder: (id) => 'Inserted loan with ID: $id.',
    );
  }

  /// Creates a list of [Loan] entities.
  @override
  Future<List<Id>> insertObjects(List<Loan> loans) async {
    return executeAndLog<List<Id>>(
      method: () => _isar.writeTxnSync(() => collection.putAllSync(loans)),
      logger: _log,
      taskDescription: 'Insert loans',
      extraMessageBuilder: (ids) =>
          'Inserted ${ids.length} out of ${loans.length} loans successfully.',
    );
  }

  /// Deletes a [Loan] entity by its ID.
  @override
  Future<bool> deleteObject(Id id) async {
    return executeAndLog<bool>(
      method: () => _isar.writeTxn(() => collection.delete(id)),
      logger: _log,
      taskDescription: 'Delete loan',
      extraMessageBuilder: (success) => success
          ? 'Loan with ID: $id deleted successfully.'
          : 'Failed to delete loan with ID: $id.',
    );
  }

  /// Deletes multiple [Loan] entities by their IDs.
  @override
  Future<Id> deleteObjects(List<Id> ids) async {
    return executeAndLog<Id>(
      method: () => _isar.writeTxn(() => collection.deleteAll(ids)),
      logger: _log,
      taskDescription: 'Delete loans',
      extraMessageBuilder: (count) =>
          'Deleted $count out of ${ids.length} loans successfully.',
    );
  }

  /// Finds a [Loan] entity by its ID.
  @override
  Future<Loan?> findObjectById(Id id) async {
    return executeAndLog<Loan?>(
      method: () => collection.get(id),
      logger: _log,
      taskDescription: 'Find loan by ID',
    );
  }

  /// Retrieves all [Loan] entities from the database.
  @override
  Future<List<Loan>> getAllObjects() async {
    return executeAndLog<List<Loan>>(
      method: () => collection.where().findAll(),
      logger: _log,
      taskDescription: 'Get all loans',
      extraMessageBuilder: (loans) => 'Retrieved ${loans.length} loans.',
    );
  }
}
