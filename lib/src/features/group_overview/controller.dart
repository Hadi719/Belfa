import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../models/collections/group.dart';
import '../../repositories/group_repository.dart';

/// Manages the state and behavior of the group overview screen.
/// This includes fetching groups, handling search, and providing data to the UI.
class GroupOverviewController extends GetxController {
  /// Repository for accessing groups data.
  final GroupRepository _repository = Get.find<GroupRepository>();

  /// Stream to listen for changes in the groups collection.
  late Stream<void> _groupsStream;

  /// Internal list of all groups fetched from the repository.
  final RxList<Group> _allGroups = <Group>[].obs;

  /// Filtered list of groups displayed in the UI, updated based on search.
  final RxList<Group> displayedGroups = <Group>[].obs;

  /// The current search query.
  final searchQuery = ''.obs;

  /// Controller for the search text field.
  final TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    // Initialize data and set up listeners.
    loadGroups();
    _listenForGroupChanges();
    _setupSearchListener();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  /// Fetches the complete list of groups from the repository and updates the UI.
  Future<void> loadGroups() async {
    _allGroups.value = await _repository.getAllGroups();
    _filterGroups();
  }

  /// Sets up a listener for changes in the search query to trigger filtering.
  void _setupSearchListener() {
    debounce(
      searchQuery,
      (_) => _filterGroups(),
      time: const Duration(milliseconds: 300),
    );
  }

  /// Filters the displayed groups based on the current search query.
  void _filterGroups() {
    if (searchQuery.isEmpty) {
      displayedGroups.value = _allGroups;
      return;
    }

    final query = searchQuery.value.toLowerCase();

    displayedGroups.value = _allGroups.where((group) {
      final name = group.name.toLowerCase();
      return name.contains(query);
    }).toList();
  }

  /// Deletes a group from the repository and refreshes the group list.
  Future<void> deleteGroup(Group group) async {
    await _repository.deleteGroup(group.id);
    await loadGroups();
  }

  /// Listens for changes in the groups collection and refreshes the UI.
  void _listenForGroupChanges() {
    _groupsStream = _repository.collection.watchLazy();

    _groupsStream.listen((event) {
      loadGroups();
    });
  }
}
