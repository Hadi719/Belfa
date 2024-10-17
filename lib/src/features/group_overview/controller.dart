import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../models/collections/group.dart';
import '../../repositories/group_repository.dart';

class GroupOverviewController extends GetxController {
  /// Repository for accessing groups data.
  final GroupRepository _repository = Get.find<GroupRepository>();

  /// Observable list of all groups, used for filtering.
  final RxList<Group> _allGroups = <Group>[].obs;

  /// Observable list of members displayed in the UI, updated based on search.
  final RxList<Group> groups = <Group>[].obs;

  /// The current search query.
  final searchQuery = ''.obs;

  final TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    loadGroups();

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

  /// Loads the full list of groups from the repository.
  Future<void> loadGroups() async {
    _allGroups.value = await _repository.getAllGroups();
    _filterMembers();
  }

  /// Filters the groups list based on the current search query.
  void _filterMembers() {
    if (searchQuery.isEmpty) {
      groups.value = _allGroups;
      return;
    }

    final query = searchQuery.value.toLowerCase();

    groups.value = _allGroups.where((group) {
      final name = group.name.toLowerCase();
      return name.contains(query);
    }).toList();
  }

  /// Deletes a group from the repository and the group list.
  Future<void> deleteGroup(Group group) async {
    await _repository.deleteGroup(group.id);
    await loadGroups();
  }
}
