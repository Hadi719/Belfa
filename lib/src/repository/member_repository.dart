import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:logging/logging.dart';

import '../model/db/member.dart';
import '../services/isar_service.dart';
import '../utils/usecase/try_method.dart';

Logger log = Logger('main.repository.member');

class MemberRepository {
  late IsarCollection<Member> members;

  late Isar _isar;

  MemberRepository init() {
    try {
      log.info('member repository init started...');

      _isar = Get.find<IsarService>().isar;
      members = _isar.members;

      log.info('member repository init completed');
      return this;
    } catch (e) {
      log.severe('Failed to initialize member repository', [e]);
      rethrow;
    }
  }

  /// Inserts/updates a member
  Future<Id> insertmember(Member data) async {
    return tryMethod<Id>(
      method: () async {
        late Id id;
        await _isar.writeTxn(() async {
          id = await members.put(data);
        });
        return id;
      },
      log: log,
      message: 'Insert member',
    );
  }

  /// Inserts/updates list of members
  Future<List<Id>> insertmembers(List<Member> data) async {
    return tryMethod<List<Id>>(
      method: () async {
        List<Id> ids = <Id>[];
        await _isar.writeTxn(() async {
          ids.addAll(await members.putAll(data));
        });
        return ids;
      },
      log: log,
      message: 'Insert members',
      extraMessage: '==> ${data.length} out of ${data.length} was successful',
    );
  }

  /// Deletes a member
  Future<bool> deletemember(Id id) async {
    return tryMethod<bool>(
      method: () async {
        bool success = false;
        await _isar.writeTxn(() async {
          success = await members.delete(id);
        });
        return success;
      },
      log: log,
      message: 'Delete member (id: $id)',
    );
  }

  /// Deletes members
  Future<int> deletemembers(List<Id> ids) async {
    return tryMethod<int>(
      method: () async {
        int count = 0;
        await _isar.writeTxn(() async {
          count = await members.deleteAll(ids);
        });
        return count;
      },
      log: log,
      message: 'Delete members',
      extraMessage: '==> ${ids.length} out of ${ids.length} was successful',
    );
  }

  /// Finds member by id
  Future<Member?> findmemberById(Id id) async {
    return tryMethod<Member?>(
      method: () async {
        return await members.get(id);
      },
      log: log,
      message: 'Find member by id',
    );
  }

  /// Gets all members
  Future<List<Member>> getAllmembers() async {
    return tryMethod<List<Member>>(
      method: () async {
        return await members.where().findAll();
      },
      log: log,
      message: 'get all members',
    );
  }
}
