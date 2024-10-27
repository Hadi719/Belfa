import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:logging/logging.dart';

import '../models/isar/member.dart';
import '../services/isar_service.dart';
import '../utils/usecase/execute_and_log.dart';
import 'base/collection_repository.dart';

Logger _log = Logger('repository.member');

/// Repository for managing [Member] entities in the Isar database.
class MemberRepository extends CollectionRepository<Member> {
  /// Isar collection for accessing [Member] entities.
  @override
  IsarCollection<Member> get collection => _isar.members;

  late Isar _isar;

  /// Initializes the repository by obtaining a reference to the [Isar] instance
  /// and the [members] collection.
  MemberRepository init() {
    _log.info('Initializing MemberRepository...');

    try {
      _isar = Get.find<IsarService>().isar;
      collection = _isar.members;

      _log.info('MemberRepository initialized.');
    } catch (e) {
      _log.severe('Failed to initialize MemberRepository: $e', [e]);
      rethrow;
    }

    return this;
  }

  /// Creates or updates a [Member] entity.
  @override
  Future<Id> insertObject(Member member) async {
    return executeAndLog<Id>(
      method: () => _isar.writeTxnSync(() => collection.putSync(member)),
      logger: _log,
      taskDescription: 'Insert member',
      extraMessageBuilder: (id) =>
          'Inserted member with ID: $id, Name: ${member.name}, Last Name: ${member.lastName}',
    );
  }

  /// Creates or updates a list of [Member] entities.
  @override
  Future<List<Id>> insertObjects(List<Member> members) async {
    return executeAndLog<List<Id>>(
      method: () => _isar.writeTxnSync(() => collection.putAllSync(members)),
      logger: _log,
      taskDescription: 'Insert members',
      extraMessageBuilder: (ids) =>
          'Inserted ${ids.length} out of ${members.length} members successfully.',
    );
  }

  /// Deletes a [Member] entity by its ID.
  @override
  Future<bool> deleteObject(Id id) async {
    return executeAndLog<bool>(
      method: () => _isar.writeTxn(() => collection.delete(id)),
      logger: _log,
      taskDescription: 'Delete member',
      extraMessageBuilder: (success) => success
          ? 'Member with ID: $id deleted successfully.'
          : 'Failed to delete member with ID: $id.',
    );
  }

  /// Deletes multiple [Member] entities by their IDs.
  @override
  Future<Id> deleteObjects(List<Id> ids) async {
    return executeAndLog<Id>(
      method: () => _isar.writeTxn(() => collection.deleteAll(ids)),
      logger: _log,
      taskDescription: 'Delete members',
      extraMessageBuilder: (count) =>
          'Deleted $count out of ${ids.length} members successfully.',
    );
  }

  /// Finds a [Member] entity by its ID.
  @override
  Future<Member?> findObjectById(Id id) async {
    return executeAndLog<Member?>(
      method: () => collection.get(id),
      logger: _log,
      taskDescription: 'Find member by ID',
    );
  }

  /// Retrieves all [Member] entities from the database.
  @override
  Future<List<Member>> getAllObjects() async {
    return executeAndLog<List<Member>>(
      method: () => collection.where().findAll(),
      logger: _log,
      taskDescription: 'Get all members',
      extraMessageBuilder: (members) => 'Retrieved ${members.length} members.',
    );
  }
}
