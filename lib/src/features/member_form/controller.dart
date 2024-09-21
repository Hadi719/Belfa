import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/db/member.dart';
import '../../repositories/member_repository.dart';

class MemberFormController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  Member? _member;

  final MemberRepository _repository = Get.find<MemberRepository>();

  MemberFormController();

  @override
  void onInit() {
    super.onInit();
    _member = Get.arguments;
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
    _member ??= Member()
      ..name = nameController.text
      ..lastName = lastNameController.text
      ..phoneNumber = phoneNumberController.text;

    if (_member != null) {
      await _repository.insertMember(_member!);
    }
  }

  Future<void> deleteMember() async {
    if (_member == null) {
      return;
    }
    await _repository.deleteMember(_member!.id);
  }
}
