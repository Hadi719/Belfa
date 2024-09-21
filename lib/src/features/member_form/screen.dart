import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/db/member.dart';
import '../../utils/localization/translation/translation_keys.dart';
import 'controller.dart';

class MemberFormScreen extends StatelessWidget {
  const MemberFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MemberFormController>();
    final Member? member = Get.arguments;
    final String appBarTitle = member != null
        ? '${TranslationKey.edit.name.tr} ${TranslationKey.member.name.tr.toLowerCase()}'
        : '${TranslationKey.add.name.tr} ${TranslationKey.member.name.tr.toLowerCase()}';
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        elevation: 16.0,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              TextFormField(
                controller: controller.nameController,
                decoration: InputDecoration(
                  labelText: TranslationKey.firstName.name.tr,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'First Name is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: controller.lastNameController,
                decoration: InputDecoration(
                  labelText: TranslationKey.lastName.name.tr,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Last Name is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: controller.phoneNumberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: TranslationKey.phoneNumber.name.tr,
                ),
                validator: (value) {
                  // ... other validation
                  if (!RegExp(r'^\d{11}$').hasMatch(value!)) {
                    // Example: 10-digit phone number
                    return 'Please enter a valid 10-digit phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),
              // Save Button
              ElevatedButton(
                onPressed: () async {
                  if (controller.formKey.currentState!.validate()) {
                    controller.saveMember();
                    Get.back();
                  }
                },
                child: Text(TranslationKey.save.name.tr),
              ),
              const SizedBox(height: 16),
              // Cancel button
              ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: Text(TranslationKey.cancel.name.tr),
              ),
              const SizedBox(height: 16),
              // Add a button to delete the member if it's an edit operation
              if (member != null)
                ElevatedButton(
                  onPressed: () {
                    Get.defaultDialog(
                      title: TranslationKey.delete.name.tr,
                      middleText:
                          '${TranslationKey.confirm.name.tr} ${TranslationKey.delete.name.tr} ${TranslationKey.member.name.tr.toLowerCase()}?',
                      onConfirm: () async {
                        await controller.deleteMember();
                        Get.back();
                        Get.back();
                      },
                      onCancel: () {},
                      textConfirm: TranslationKey.confirm.name.tr,
                      textCancel: TranslationKey.cancel.name.tr,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Get.theme.colorScheme.error,
                    foregroundColor: Get.theme.colorScheme.onError,
                    elevation: 8.0,
                  ),
                  child: Text(TranslationKey.delete.name.tr),
                ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
