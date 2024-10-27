import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/localization/translation/translation_keys.dart';
import '../../utils/widget/belfa_form_screen.dart';
import 'controller.dart';

class MemberFormScreen extends StatelessWidget {
  const MemberFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MemberFormController>();

    return BfFormScreen(
      formKey: controller.formKey,
      appBarTitle: controller.isEditing
          ? '${TranslationKey.edit.name.tr} ${TranslationKey.member.name.tr.toLowerCase()}'
          : '${TranslationKey.add.name.tr} ${TranslationKey.member.name.tr.toLowerCase()}',
      bfTextFormFields: <BfTextFormField>[
        BfTextFormField(
          controller: controller.nameController,
          labelText: TranslationKey.firstName.name.tr,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'First Name is required';
            }
            return null;
          },
        ),
        BfTextFormField(
          controller: controller.lastNameController,
          labelText: TranslationKey.lastName.name.tr,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Last Name is required';
            }
            return null;
          },
        ),
        BfTextFormField(
          controller: controller.phoneNumberController,
          keyboardType: TextInputType.number,
          labelText: TranslationKey.phoneNumber.name.tr,
          validator: (value) {
            // ... other validation
            if (!RegExp(r'^\d{11}$').hasMatch(value!)) {
              // Example: 10-digit phone number
              return 'Please enter a valid 10-digit phone number';
            }
            return null;
          },
        ),
      ],
      bfFormButtons: BfFormButtons(
        isDeleteButtonVisible: controller.isEditing,
        confirmDeleteObjectText: TranslationKey.member.name.tr.toLowerCase(),
        onPressedSaved: () async {
          if (controller.formKey.currentState!.validate()) {
            controller.saveMember();
            Get.back();
          }
        },
        onConfirmDelete: () async {
          await controller.deleteMember();
          Get.back();
          Get.back();
        },
      ),
    );
  }
}
