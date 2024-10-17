import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/collections/member.dart';
import '../../repositories/member_repository.dart';
import '../member_overview/controller.dart';

class MemberFormController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();

  Member? _member;
  bool get isEditing => _member != null;

  final MemberRepository _repository = Get.find<MemberRepository>();

  MemberFormController();

  @override
  void onInit() {
    super.onInit();
    _member = Get.arguments as Member?;
    _initializeFormFields();
  }

  void _initializeFormFields() {
    if (_member != null) {
      nameController.text = _member?.name ?? '';
      lastNameController.text = _member?.lastName ?? '';
      phoneNumberController.text = _member?.phoneNumber ?? '';
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
    super.onClose();
  }

  Future<void> saveMember() async {
    _member ??= Member();

    _member!
      ..name = nameController.text
      ..lastName = lastNameController.text
      ..phoneNumber = phoneNumberController.text;

    await _repository.insertMember(_member!);
    await _updateMemberOverview();
  }

  Future<void> deleteMember() async {
    if (_member == null) {
      return;
    }
    await _repository.deleteMember(_member!.id);
    await _updateMemberOverview();
  }

  Future<void> _updateMemberOverview() async {
    if (Get.isRegistered<MemberOverviewController>()) {
      await Get.find<MemberOverviewController>().loadMembers();
    }
  }
}
