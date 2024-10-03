import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/db/group.dart';
import '../../repositories/group_repository.dart';
import '../group_overview/controller.dart';

class GroupFormController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final bankCardNumberController = TextEditingController();
  final bankAccountNumberController = TextEditingController();
  Group? _group;

  final GroupRepository _repository = Get.find<GroupRepository>();

  GroupFormController();

  @override
  void onInit() {
    super.onInit();
    _group = Get.arguments;
    _initializeFormFields();
  }

  void _initializeFormFields() {
    if (_group != null) {
      nameController.text = _group?.name ?? '';
      bankCardNumberController.text = _group?.bankCardNumber?.toString() ?? '';
      bankAccountNumberController.text =
          _group?.bankAccountNumber?.toString() ?? '';
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
    _group ??= Group()
      ..name = nameController.text
      ..bankCardNumber = int.tryParse(bankCardNumberController.text)
      ..bankAccountNumber = int.tryParse(bankAccountNumberController.text);

    if (_group != null) {
      await _repository.insertGroup(_group!);
      await _updateGroupOverview();
    }
  }

  Future<void> deleteGroup() async {
    if (_group == null) {
      return;
    }
    await _repository.deleteGroup(_group!.id);
    await _updateGroupOverview();
  }

  Future<void> _updateGroupOverview() async {
    if (Get.isRegistered<GroupOverviewController>()) {
      await Get.find<GroupOverviewController>().loadGroups();
    }
  }
}
