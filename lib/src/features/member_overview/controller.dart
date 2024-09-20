import 'package:get/get.dart';
import 'package:isar/isar.dart';

import '../../model/db/member.dart';
import '../../services/isar_service.dart';

class MemberOverviewController extends GetxController {
  final RxList<Member> _members = <Member>[].obs;
  List<Member> get members => _members.toList();
  String _searchQuery = '';

  late final Isar _isar;

  @override
  void onInit() {
    super.onInit();
    _isar = Get.find<IsarService>().isar;

    loadMembers();
  }

  set searchQuery(String value) {
    _searchQuery = value;
    _filterMembers();
  }

  Future<void> loadMembers() async {
    _members.value = await _isar.members.where().findAll();
  }

  void _filterMembers() {
    if (_searchQuery.isEmpty) {
      loadMembers();
      return;
    }
    _members.value = _members
        .where((member) =>
            (member.name ?? '').toLowerCase().contains(_searchQuery) ||
            (member.lastName ?? '').toLowerCase().contains(_searchQuery) ||
            (member.phoneNumber ?? '').contains(_searchQuery))
        .toList();
  }

  Future<void> deleteMember(Member member) async {
    await _isar.writeTxn(() async {
      await _isar.members.delete(member.id);
    });
    _members.remove(member);
  }
}
