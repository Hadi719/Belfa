import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:logging/logging.dart';

import '../model/db/group.dart';
import '../services/isar_service.dart';
import '../utils/usecase/try_method.dart';

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
    return tryMethod<Id>(
      method: () async {
        late Id id;
        await _isar.writeTxn(() async {
          id = await groups.put(data);
        });
        return id;
      },
      log: log,
      message: 'Insert group',
    );
  }

  /// Inserts/updates list of groups
  Future<List<Id>> insertGroups(List<Group> data) async {
    return tryMethod<List<Id>>(
      method: () async {
        List<Id> ids = <Id>[];
        await _isar.writeTxn(() async {
          ids.addAll(await groups.putAll(data));
        });
        return ids;
      },
      log: log,
      message: 'Insert groups',
      extraMessage: '==> ${data.length} out of ${data.length} was successful',
    );
  }

  /// Deletes a group
  Future<bool> deleteGroup(Id id) async {
    return tryMethod<bool>(
      method: () async {
        bool success = false;
        await _isar.writeTxn(() async {
          success = await groups.delete(id);
        });
        return success;
      },
      log: log,
      message: 'Delete group (id: $id)',
    );
  }

  /// Deletes groups
  Future<int> deleteGroups(List<Id> ids) async {
    return tryMethod<int>(
      method: () async {
        int count = 0;
        await _isar.writeTxn(() async {
          count = await groups.deleteAll(ids);
        });
        return count;
      },
      log: log,
      message: 'Delete groups',
      extraMessage: '==> ${ids.length} out of ${ids.length} was successful',
    );
  }

  /// Finds group by id
  Future<Group?> findGroupById(Id id) async {
    return tryMethod<Group?>(
      method: () async {
        return await groups.get(id);
      },
      log: log,
      message: 'Find group by id',
    );
  }

  /// Gets all groups
  Future<List<Group>> getAllGroups() async {
    return tryMethod<List<Group>>(
      method: () async {
        return await groups.where().findAll();
      },
      log: log,
      message: 'get all groups',
    );
  }
}
