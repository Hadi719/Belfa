import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/db/member.dart';
import '../../repositories/member_repository.dart';

/// Controller for managing the member overview screen.
class MemberOverviewController extends GetxController {
  /// Repository for accessing member data.
  final MemberRepository _repository = Get.find<MemberRepository>();

  /// Observable list of all members, used for filtering.
  final RxList<Member> _allMembers = <Member>[].obs;

  /// Observable list of members displayed in the UI, updated based on search.
  final members = <Member>[].obs;

  /// The current search query.
  final searchQuery = ''.obs;

  final TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    loadMembers();

    // Set up a listener for search query changes to trigger filtering.
    debounce(
      searchQuery,
      (_) => _filterMembers(),
      time: const Duration(milliseconds: 300),
    );
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  /// Filters the member list based on the current search query.
  void _filterMembers() {
    if (searchQuery.isEmpty) {
      members.value = _allMembers;
      return;
    }

    members.value = _allMembers.where((member) {
      final name = member.name?.toLowerCase() ?? '';
      final lastName = member.lastName?.toLowerCase() ?? '';
      final phoneNumber = member.phoneNumber ?? '';
      final query = searchQuery.value.toLowerCase();
      return name.contains(query) ||
          lastName.contains(query) ||
          phoneNumber.contains(query);
    }).toList();
  }

  /// Loads the full list of members from the repository.
  Future<void> loadMembers() async {
    _allMembers.value = await _repository.getAllMembers();
    _filterMembers();
  }

  /// Deletes a member from the repository and the member list.
  Future<void> deleteMember(Member member) async {
    await _repository.deleteMember(member.id);
    await loadMembers();
  }
}
