import 'package:get/get.dart';

import '../../models/db/member.dart';
import '../../repositories/member_repository.dart';

/// Controller for managing the member overview screen.
class MemberOverviewController extends GetxController {
  /// Observable list of members.
  final RxList<Member> _members = <Member>[].obs;

  /// Provides access to the list of members.
  List<Member> get members => _members;

  /// The current search query.
  String _searchQuery = '';

  /// Repository for accessing member data.
  final MemberRepository _repository = Get.find<MemberRepository>();

  /// Initializes the controller by loading the list of members.
  @override
  void onInit() {
    super.onInit();
    _loadMembers();
  }

  /// Sets the search query and filters the member list.
  set searchQuery(String value) {
    _searchQuery = value.toLowerCase();
    _filterMembers();
  }

  /// Loads the full list of members from the repository.
  Future<void> _loadMembers() async {
    _members.value = await _repository.getAllMembers();
  }

  /// Filters the member list based on the current search query.
  void _filterMembers() {
    if (_searchQuery.isEmpty) {
      _loadMembers(); // If the search query is empty, reload the full list.
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

  /// Deletes a member from the repository and the member list.
  Future<void> deleteMember(Member member) async {
    final isDeleted = await _repository.deleteMember(member.id);
    if (isDeleted) {
      _members.remove(member);
    }
  }

  /// Adds a new member to the repository and refreshes the member list.
  Future<void> addMember(Member member) async {
    await _repository.insertMember(member);
    _loadMembers();
  }
}
