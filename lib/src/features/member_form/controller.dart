import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';

import '../../model/db/member.dart';
import '../../services/isar_service.dart';

class MemberFormController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  Member? _member;
  late final Isar _isar;

  @override
  void onInit() {
    super.onInit();
    _member = Get.arguments;
    _isar = Get.find<IsarService>().isar;
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
      await _isar.writeTxn(() async {
        await _isar.members.put(_member!);
      });
    }
  }

  Future<void> deleteMember() async {
    if (_member == null) {
      return;
    }
    await _isar.writeTxn(() async {
      await _isar.members.delete(_member!.id);
    });
  }
}
