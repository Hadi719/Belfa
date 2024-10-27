import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:logging/logging.dart';

import '../models/isar/group.dart';
import '../services/isar_service.dart';
import '../utils/usecase/execute_and_log.dart';
import 'base/collection_repository.dart';

/// Logger for the GroupRepository.
final _log = Logger('repository.group');

/// Repository for managing [Group] entities in the Isar database.
class GroupRepository extends CollectionRepository<Group> {
  late Isar _isar;

  @override
  IsarCollection<Group> get collection => _isar.groups;

  /// Initializes the repository by obtaining a reference to the [Isar] instance
  /// and the [collection] collection.
  GroupRepository init() {
    _log.info('Initializing GroupRepository...');

    try {
      _isar = Get.find<IsarService>().isar;

      _log.info('GroupRepository initialized.');
    } catch (e) {
      _log.severe('Failed to initialize GroupRepository: $e', [e]);
      rethrow;
    }

    return this;
  }

  /// Creates or updates a [Group] entity.
  @override
  Future<Id> insertObject(Group group) async {
    return executeAndLog<Id>(
      method: () => _isar.writeTxnSync(() {
        final result = collection.putSync(group);
        _updateLinks(group);
        return result;
      }),
      logger: _log,
      taskDescription: 'Insert group',
      extraMessageBuilder: (id) => 'Inserted group with ID: $id.',
    );
  }

  /// Creates or update a list of [Group] entities.
  @override
  Future<List<Id>> insertObjects(List<Group> groups) async {
    return executeAndLog<List<Id>>(
      method: () => _isar.writeTxnSync(() {
        final result = collection.putAllSync(groups);
        groups.forEach(_updateLinks);
        return result;
      }),
      logger: _log,
      taskDescription: 'Insert groups',
      extraMessageBuilder: (ids) =>
          'Inserted ${ids.length} out of ${groups.length} groups successfully.',
    );
  }

  /// Deletes a [Group] entity by its ID.
  @override
  Future<bool> deleteObject(Id id) async {
    return executeAndLog<bool>(
      method: () => _isar.writeTxn(() => collection.delete(id)),
      logger: _log,
      taskDescription: 'Delete group',
      extraMessageBuilder: (success) => success
          ? 'Group with ID: $id deleted successfully.'
          : 'Failed to delete group with ID: $id.',
    );
  }

  /// Deletes multiple [Group] entities by their IDs.
  @override
  Future<Id> deleteObjects(List<Id> ids) async {
    return executeAndLog<int>(
      method: () => _isar.writeTxn(() => collection.deleteAll(ids)),
      logger: _log,
      taskDescription: 'Delete groups',
      extraMessageBuilder: (count) =>
          'Deleted $count out of ${ids.length} groups successfully.',
    );
  }

  /// Finds a [Group] entity by its ID.
  @override
  Future<Group?> findObjectById(Id id) async {
    return executeAndLog<Group?>(
      method: () => collection.get(id),
      logger: _log,
      taskDescription: 'Find group by ID',
    );
  }

  /// Retrieves all [Group] entities from the database.
  @override
  Future<List<Group>> getAllObjects() async {
    return executeAndLog<List<Group>>(
      method: () => collection.where().findAll(),
      logger: _log,
      taskDescription: 'Get all groups',
      extraMessageBuilder: (groups) => 'Retrieved ${groups.length} groups.',
    );
  }

  void _updateLinks(Group group) {
    group.members.updateSync(reset: true, link: group.members);
    group.loans.updateSync(reset: true, link: group.loans);
  }
}
