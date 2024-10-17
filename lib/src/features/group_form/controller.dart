import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/collections/group.dart';
import '../../models/collections/member.dart';
import '../../repositories/group_repository.dart';
import '../group_overview/controller.dart';

class GroupFormController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final bankCardNumberController = TextEditingController();
  final bankAccountNumberController = TextEditingController();

  final members = <Member>[].obs;
  final loanTurns = <LoanTurn>[].obs;

  Group? _group;
  bool get isEditing => _group != null;

  final GroupRepository _repository = Get.find<GroupRepository>();

  @override
  void onInit() {
    super.onInit();
    _group = Get.arguments as Group?;
    _initializeFormFields();
  }

  void _initializeFormFields() {
    if (_group != null) {
      nameController.text = _group!.name;
      bankCardNumberController.text = _group!.bankCardNumber?.toString() ?? '';
      bankAccountNumberController.text =
          _group!.bankAccountNumber?.toString() ?? '';
      members.addAll(_group!.members);
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    bankCardNumberController.dispose();
    bankAccountNumberController.dispose();
    super.onClose();
  }

  Future<void> saveGroup() async {
    _group ??= Group();

    _group!
      ..name = nameController.text
      ..bankCardNumber = int.tryParse(bankCardNumberController.text)
      ..bankAccountNumber = int.tryParse(bankAccountNumberController.text)
      ..members.addAll(members);

    await _repository.insertGroup(_group!);
    await _updateGroupOverview();
  }

  Future<void> deleteGroup() async {
    if (_group == null) {
      return;
    }
    await _repository.deleteGroup(_group!.id);
    await _updateGroupOverview();
  }

  void addMembers(List<Member> selectedMembers) {
    members.value = selectedMembers;
  }

  Future<void> _updateGroupOverview() async {
    if (Get.isRegistered<GroupOverviewController>()) {
      await Get.find<GroupOverviewController>().loadGroups();
    }
  }
}
