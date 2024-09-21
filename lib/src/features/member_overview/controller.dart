import 'package:get/get.dart';

import '../../models/db/member.dart';
import '../../repositories/member_repository.dart';

class MemberOverviewController extends GetxController {
  final RxList<Member> _members = <Member>[].obs;
  List<Member> get members => _members.value;
  String _searchQuery = '';

  final MemberRepository _repository;

  MemberOverviewController(this._repository);

  @override
  void onInit() {
    super.onInit();
    _loadMembers();
  }

  set searchQuery(String value) {
    _searchQuery = value.toLowerCase();
    _filterMembers();
  }

  Future<void> _loadMembers() async {
    _members.value = await _repository.getAllMembers();
  }

  void _filterMembers() {
    if (_searchQuery.isEmpty) {
      _loadMembers();
      return;
    }

    _members.value = _members.where((member) {
      final name = member.name?.toLowerCase() ?? '';
      final lastName = member.lastName?.toLowerCase() ?? '';
      final phoneNumber = member.phoneNumber ?? '';
      return name.contains(_searchQuery) ||
          lastName.contains(_searchQuery) ||
          phoneNumber.contains(_searchQuery);
    }).toList();
  }

  Future<void> deleteMember(Member member) async {
    final isDeleted = await _repository.deleteMember(member.id);
    if (isDeleted) {
      _members.remove(member);
    }
  }

  Future<void> addMember(Member member) async {
    await _repository.insertMember(member);
    _loadMembers(); // Refresh the list after adding
  }
}
