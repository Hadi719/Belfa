import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:logging/logging.dart';

import '../models/db/member.dart';
import '../services/isar_service.dart';
import '../utils/usecase/execute_and_log.dart';

Logger log = Logger('repository.member');

/// Repository for managing [Member] entities in the Isar database.
class MemberRepository {
  /// Isar collection for accessing [Member] entities.
  late IsarCollection<Member> members;

  late Isar _isar;

  /// Initializes the repository by obtaining a reference to the [Isar] instance
  /// and the [members] collection.
  MemberRepository init() {
    log.info('Initializing MemberRepository...');

    try {
      _isar = Get.find<IsarService>().isar;
      members = _isar.members;

      log.info('MemberRepository initialized.');
    } catch (e) {
      log.severe('Failed to initialize MemberRepository: $e', [e]);
      rethrow;
    }

    return this;
  }

  /// Inserts or updates a [Member] entity.
  Future<Id> insertMember(Member member) async {
    return executeAndLog<Id>(
      method: () => _isar.writeTxn(() => members.put(member)),
      logger: log,
      taskDescription: 'Insert member',
      extraMessageBuilder: (id) =>
          'Inserted member with ID: $id, Name: ${member.name}, Last Name: ${member.lastName}',
    );
  }

  /// Inserts or updates a list of [Member] entities.
  Future<List<Id>> insertMembers(List<Member> members) async {
    return executeAndLog<List<Id>>(
      method: () => _isar.writeTxn(() => this.members.putAll(members)),
      logger: log,
      taskDescription: 'Insert members',
      extraMessageBuilder: (ids) =>
          'Inserted ${ids.length} out of ${members.length} members successfully.',
    );
  }

  /// Deletes a [Member] entity by its ID.
  Future<bool> deleteMember(Id id) async {
    return executeAndLog<bool>(
      method: () => _isar.writeTxn(() => members.delete(id)),
      logger: log,
      taskDescription: 'Delete member',
      extraMessageBuilder: (success) => success
          ? 'Member with ID: $id deleted successfully.'
          : 'Failed to delete member with ID: $id.',
    );
  }

  /// Deletes multiple [Member] entities by their IDs.
  Future<int> deleteMembers(List<Id> ids) async {
    return executeAndLog<int>(
      method: () => _isar.writeTxn(() => members.deleteAll(ids)),
      logger: log,
      taskDescription: 'Delete members',
      extraMessageBuilder: (count) =>
          'Deleted $count out of ${ids.length} members successfully.',
    );
  }

  /// Finds a [Member] entity by its ID.
  Future<Member?> findMemberById(Id id) async {
    return executeAndLog<Member?>(
      method: () => members.get(id),
      logger: log,
      taskDescription: 'Find member by ID',
    );
  }

  /// Retrieves all [Member] entities from the database.
  Future<List<Member>> getAllMembers() async {
    return executeAndLog<List<Member>>(
      method: () => members.where().findAll(),
      logger: log,
      taskDescription: 'Get all members',
      extraMessageBuilder: (members) => 'Retrieved ${members.length} members.',
    );
  }
}
