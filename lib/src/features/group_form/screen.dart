import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/db/group.dart';
import '../../utils/localization/translation/translation_keys.dart';
import '../../utils/widget/bf_form_screen.dart';
import 'controller.dart';

class GroupFormScreen extends StatelessWidget {
  const GroupFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<GroupFormController>();
    final Group? group = Get.arguments;
    final String appBarTitle = group != null
        ? '${TranslationKey.edit.name.tr} ${TranslationKey.group.name.tr.toLowerCase()}'
        : '${TranslationKey.add.name.tr} ${TranslationKey.group.name.tr.toLowerCase()}';
    String hintBankCardNumber =
        '${TranslationKey.bank.name.tr} ${TranslationKey.card.name.tr} ${TranslationKey.number.name.tr}';
    String hintBankAccountNumber =
        '${TranslationKey.bank.name.tr} ${TranslationKey.account.name.tr} ${TranslationKey.number.name.tr}';
    return BfFormScreen(
      formKey: controller.formKey,
      appBarTitle: appBarTitle,
      bfTextFormFields: <BfTextFormField>[
        BfTextFormField(
          controller: controller.nameController,
          labelText: TranslationKey.name.name.tr,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Group Name is required';
            }
            return null;
          },
        ),
        BfTextFormField(
          controller: controller.bankCardNumberController,
          keyboardType: TextInputType.number,
          labelText: hintBankCardNumber,
        ),
        BfTextFormField(
          controller: controller.bankAccountNumberController,
          keyboardType: TextInputType.number,
          labelText: hintBankAccountNumber,
        ),
      ],
      bfFormButtons: BfFormButtons(
        isDeleteButtonVisible: group != null,
        confirmDeleteObjectText: TranslationKey.group.name.tr.toLowerCase(),
        onPressedSaved: () async {
          if (controller.formKey.currentState!.validate()) {
            controller.saveGroup();
            Get.back();
          }
        },
        onConfirmDelete: () async {
          await controller.deleteGroup();
          Get.back();
          Get.back();
        },
      ),
    );
  }
}
