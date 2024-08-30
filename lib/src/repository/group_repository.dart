import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:logging/logging.dart';

import '../model/db/group.dart';
import '../services/isar_service.dart';

Logger log = Logger('main.repository.group');

class GroupRepository {
  late IsarCollection<Group> groups;

  late Isar _isar;

  GroupRepository init() {
    try {
      log.info('Group repository init started...');

      _isar = Get.find<IsarService>().isar;
      groups = _isar.groups;

      log.info('Group repository init completed');
      return this;
    } catch (e) {
      log.severe('Failed to initialize Group repository', [e]);
      rethrow;
    }
  }

  /// Inserts/updates a group
  Future<Id> insertGroup(Group data) async {
    try {
      log.info('Insert group started...');

      late Id id;

      await _isar.writeTxn(() async {
        id = await groups.put(data);
      });

      log.info('Insert group completed');
      return id;
    } catch (e) {
      log.severe('Insert group failed', [e]);
      rethrow;
    }
  }

  /// Inserts/updates list of groups
  Future<List<Id>> insertGroups(List<Group> data) async {
    try {
      log.info('Insert groups started...');

      List<Id> ids = <Id>[];

      await _isar.writeTxn(() async {
        ids.addAll(await groups.putAll(data));
      });

      log.info(
          'Insert groups completed ==> ${data.length} out of ${ids.length} was successful');
      return Future.value(ids);
    } catch (e) {
      log.severe('Insert groups failed', [e]);
      return Future.error(e);
    }
  }

  /// Deletes a group
  Future<bool> deleteGroup(Id id) async {
    bool success = false;
    try {
      log.info('Delete group(id: $id) started...');

      await _isar.writeTxn(() async {
        success = await groups.delete(id);
      });

      log.info('Delete group(id: $id) completed');
      return Future.value(success);
    } catch (e) {
      log.severe('Delete group(id: $id) failed', [e]);
      return false;
    }
  }

  /// Deletes groups
  Future<int> deleteGroups(List<Id> ids) async {
    int count = 0;
    try {
      log.info('Delete groups started...');

      await _isar.writeTxn(() async {
        count = await groups.deleteAll(ids);
      });

      log.info(
          'Delete groups completed ==> $count out of ${ids.length} was successful');
      return Future.value(count);
    } catch (e) {
      log.severe('Delete groups failed', [e]);
      return Future.error(e);
    }
  }

  /// Finds group by id
  Future<Group?> findGroupById(Id id) async {
    try {
      log.info('Find group by id started...');

      final data = await groups.get(id);

      log.info('Find group by id completed');

      return Future.value(data);
    } catch (e) {
      log.severe('Find group by id failed', [e]);
      return Future.error(e);
    }
  }

  /// Gets all groups
  Future<List<Group>> getAllGroups() async {
    try {
      log.info('get all groups started...');

      List<Group> data = await groups.where().findAll();

      log.info('get all groups completed');
      return Future.value(data);
    } catch (e) {
      log.severe('get all groups failed', [e]);
      return Future.error(e);
    }
  }
}
