import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/isar/group.dart';
import '../../models/isar/member.dart';
import '../../repositories/group_repository.dart';

class GroupFormController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final bankCardNumberController = TextEditingController();
  final bankAccountNumberController = TextEditingController();

  final members = <Member>[].obs;
  final loanTurns = <LoanTurn>[].obs;

  Group? _group;
  bool isEditing = false;

  final GroupRepository _repository = Get.find<GroupRepository>();

  @override
  void onInit() {
    super.onInit();
    _group = Get.arguments as Group?;
    isEditing = _group != null;
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
      ..members.assignAll(members.toList());

    await _repository.insertObject(_group!);
  }

  Future<void> deleteGroup() async {
    if (_group == null) {
      return;
    }
    await _repository.deleteObject(_group!.id);
  }

  Future<void> addMembers(List<Member> selectedMembers) async {
    members.assignAll(selectedMembers);
  }
}
