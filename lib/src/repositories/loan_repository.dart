import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:logging/logging.dart';

import '../models/db/loan.dart';
import '../services/isar_service.dart';
import '../utils/usecase/execute_and_log.dart';

Logger log = Logger('repository.loan');

/// Repository for managing [Loan] entities in the Isar database.
class LoanRepository {
  /// Isar collection for accessing [Loan] entities.
  late IsarCollection<Loan> loans;

  late Isar _isar;

  /// Initializes the repository by obtaining a reference to the [Isar] instance
  /// and the [loans] collection.
  LoanRepository init() {
    log.info('Initializing LoanRepository...');

    try {
      _isar = Get.find<IsarService>().isar;
      loans = _isar.loans;

      log.info('LoanRepository initialized.');
    } catch (e) {
      log.severe('Failed to initialize LoanRepository: $e', [e]);
      rethrow;
    }

    return this;
  }

  /// Inserts or updates a [Loan] entity.
  Future<Id> insertLoan(Loan loan) async {
    return executeAndLog<Id>(
      method: () => _isar.writeTxn(() => loans.put(loan)),
      logger: log,
      taskDescription: 'Insert loan',
      extraMessageBuilder: (id) => 'Inserted loan with ID: $id.',
    );
  }

  /// Inserts or updates a list of [Loan] entities.
  Future<List<Id>> insertLoans(List<Loan> loans) async {
    return executeAndLog<List<Id>>(
      method: () => _isar.writeTxn(() => this.loans.putAll(loans)),
      logger: log,
      taskDescription: 'Insert loans',
      extraMessageBuilder: (ids) =>
          'Inserted ${ids.length} out of ${loans.length} loans successfully.',
    );
  }

  /// Deletes a [Loan] entity by its ID.
  Future<bool> deleteLoan(Id id) async {
    return executeAndLog<bool>(
      method: () => _isar.writeTxn(() => loans.delete(id)),
      logger: log,
      taskDescription: 'Delete loan',
      extraMessageBuilder: (success) => success
          ? 'Loan with ID: $id deleted successfully.'
          : 'Failed to delete loan with ID: $id.',
    );
  }

  /// Deletes multiple [Loan] entities by their IDs.
  Future<int> deleteLoans(List<Id> ids) async {
    return executeAndLog<int>(
      method: () => _isar.writeTxn(() => loans.deleteAll(ids)),
      logger: log,
      taskDescription: 'Delete loans',
      extraMessageBuilder: (count) =>
          'Deleted $count out of ${ids.length} loans successfully.',
    );
  }

  /// Finds a [Loan] entity by its ID.
  Future<Loan?> findLoanById(Id id) async {
    return executeAndLog<Loan?>(
      method: () => loans.get(id),
      logger: log,
      taskDescription: 'Find loan by ID',
    );
  }

  /// Retrieves all [Loan] entities from the database.
  Future<List<Loan>> getAllLoans() async {
    return executeAndLog<List<Loan>>(
      method: () => loans.where().findAll(),
      logger: log,
      taskDescription: 'Get all loans',
      extraMessageBuilder: (loans) => 'Retrieved ${loans.length} loans.',
    );
  }
}
