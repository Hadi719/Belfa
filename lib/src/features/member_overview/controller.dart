import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/collections/member.dart';
import '../../repositories/member_repository.dart';
import 'model/arguments.dart';

/// Controller for managing the member overview screen.
class MemberOverviewController extends GetxController {
  /// Repository for accessing member data.
  final MemberRepository _repository = Get.find<MemberRepository>();

  /// Observable list of all members, used for filtering.
  final RxList<Member> _allMembers = <Member>[].obs;

  /// Observable list of members displayed in the UI, updated based on search.
  final RxList<Member> displayedMembers = <Member>[].obs;

  /// Observable list of selected members
  final RxList<Member> selectedMembers = <Member>[].obs;

  /// Flag to control whether selection mode is active
  final RxBool isSelectionMode = false.obs;

  /// Flag to control whether is only for selection mode
  final RxBool isOnlySelectionMode = false.obs;

  /// Flag to control whether all member is selected
  final RxBool isAllMemberSelected = false.obs;

  /// The current search query.
  final RxString searchQuery = ''.obs;

  final TextEditingController searchController = TextEditingController();

  MemberOverviewController();

  @override
  Future<void> onInit() async {
    super.onInit();

    await loadMembers();

    getArguments();

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
      displayedMembers.value = _allMembers;
      return;
    }

    final query = searchQuery.value.toLowerCase();

    displayedMembers.value = _allMembers.where((member) {
      final name = member.name?.toLowerCase() ?? '';
      final lastName = member.lastName?.toLowerCase() ?? '';
      final phoneNumber = member.phoneNumber ?? '';
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

  void toggleMemberSelection(Member member) {
    if (selectedMembers.contains(member)) {
      selectedMembers.remove(member);
    } else {
      selectedMembers.add(member);
    }
  }

  /// Toggles selection mode on long press
  void onLongPressMember(Member member) {
    toggleMemberSelection(member);
    isSelectionMode.value = true;
    isAllMemberSelected.value = false;
  }

  /// Selects all members
  void selectAllMembers() {
    selectedMembers.value = List.from(displayedMembers);
    isAllMemberSelected.value = true;
  }

  /// Deselects all members
  void deselectAllMembers() {
    selectedMembers.clear();
    isAllMemberSelected.value = false;
  }

  /// Clears the selection and disables selection mode
  void disableSelectionMode() {
    selectedMembers.clear();
    isSelectionMode.value = false;
    isAllMemberSelected.value = false;
  }

  Future<void> deleteSelectedMembers() async {
    await _repository.deleteMembers(selectedMembers.map((e) => e.id).toList());

    disableSelectionMode();
  }

  /// Checks if all currently displayed members are selected.
  bool get areAllMembersSelected {
    return displayedMembers.length == selectedMembers.length &&
        displayedMembers.isNotEmpty;
  }

  void getArguments() {
    if (Get.arguments == null || Get.arguments is! MemberOverviewArguments) {
      return;
    }

    final MemberOverviewArguments arguments = Get.arguments;
    isOnlySelectionMode.value = arguments.isOnlySelectionMode;
    if (arguments.membersId.isNotEmpty) {
      selectedMembers.value =
          _allMembers.where((e) => arguments.membersId.contains(e.id)).toList();
    }
    isSelectionMode.value = true;
    isAllMemberSelected.value = areAllMembersSelected;
  }
}
