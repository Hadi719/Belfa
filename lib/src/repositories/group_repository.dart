import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:logging/logging.dart';

import '../models/collections/group.dart';
import '../services/isar_service.dart';
import '../utils/usecase/execute_and_log.dart';

/// Logger for the GroupRepository.
final log = Logger('repository.group');

/// Repository for managing [Group] entities in the Isar database.
class GroupRepository {
  /// Isar collection for accessing [Group] entities.
  late IsarCollection<Group> collection;

  late Isar _isar;

  /// Initializes the repository by obtaining a reference to the [Isar] instance
  /// and the [collection] collection.
  GroupRepository init() {
    log.info('Initializing GroupRepository...');

    try {
      _isar = Get.find<IsarService>().isar;
      collection = _isar.groups;

      log.info('GroupRepository initialized.');
    } catch (e) {
      log.severe('Failed to initialize GroupRepository: $e', [e]);
      rethrow;
    }

    return this;
  }

  /// Creates or updates a [Group] entity.
  Future<Id> insertGroup(Group group) async {
    return executeAndLog<Id>(
      method: () => _isar.writeTxnSync(() {
        final result = collection.putSync(group);
        group.members.updateSync(reset: true, link: group.members);
        group.loans.updateSync(reset: true, link: group.loans);
        return result;
      }),
      logger: log,
      taskDescription: 'Insert group',
      extraMessageBuilder: (id) => 'Inserted group with ID: $id.',
    );
  }

  /// Creates a list of [Group] entities.
  ///
  /// use this only for importing new groups, don't use this for updating the
  /// groups, because the [IsarLinks] may not be updated, for update a [Group]
  /// use [insertGroup] function.
  Future<List<Id>> insertGroups(List<Group> groups) async {
    return executeAndLog<List<Id>>(
      method: () => _isar.writeTxnSync(() => collection.putAllSync(groups)),
      logger: log,
      taskDescription: 'Insert groups',
      extraMessageBuilder: (ids) =>
          'Inserted ${ids.length} out of ${groups.length} groups successfully.',
    );
  }

  /// Deletes a [Group] entity by its ID.
  Future<bool> deleteGroup(Id id) async {
    return executeAndLog<bool>(
      method: () => _isar.writeTxn(() => collection.delete(id)),
      logger: log,
      taskDescription: 'Delete group',
      extraMessageBuilder: (success) => success
          ? 'Group with ID: $id deleted successfully.'
          : 'Failed to delete group with ID: $id.',
    );
  }

  /// Deletes multiple [Group] entities by their IDs.
  Future<int> deleteGroups(List<Id> ids) async {
    return executeAndLog<int>(
      method: () => _isar.writeTxn(() => collection.deleteAll(ids)),
      logger: log,
      taskDescription: 'Delete groups',
      extraMessageBuilder: (count) =>
          'Deleted $count out of ${ids.length} groups successfully.',
    );
  }

  /// Finds a [Group] entity by its ID.
  Future<Group?> findGroupById(Id id) async {
    return executeAndLog<Group?>(
      method: () => collection.get(id),
      logger: log,
      taskDescription: 'Find group by ID',
    );
  }

  /// Retrieves all [Group] entities from the database.
  Future<List<Group>> getAllGroups() async {
    return executeAndLog<List<Group>>(
      method: () => collection.where().findAll(),
      logger: log,
      taskDescription: 'Get all groups',
      extraMessageBuilder: (groups) => 'Retrieved ${groups.length} groups.',
    );
  }
}
