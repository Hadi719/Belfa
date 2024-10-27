import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/route/app_pages.dart';
import '../../models/isar/member.dart';
import '../../utils/localization/translation/translation_keys.dart';
import '../../utils/widget/belfa_form_screen.dart';
import '../collections/models/arguments.dart';
import '../collections/models/result.dart';
import 'controller.dart';

class GroupFormScreen extends StatelessWidget {
  const GroupFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GroupFormController controller = Get.find();

    return BfFormScreen(
      formKey: controller.formKey,
      appBarTitle: controller.isEditing
          ? '${TranslationKey.edit.name.tr} ${TranslationKey.group.name.tr.toLowerCase()}'
          : '${TranslationKey.add.name.tr} ${TranslationKey.group.name.tr.toLowerCase()}',
      bfTextFormFields: [
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
          labelText:
              '${TranslationKey.bank.name.tr} ${TranslationKey.card.name.tr} ${TranslationKey.number.name.tr}',
        ),
        BfTextFormField(
          controller: controller.bankAccountNumberController,
          keyboardType: TextInputType.number,
          labelText:
              '${TranslationKey.bank.name.tr} ${TranslationKey.account.name.tr} ${TranslationKey.number.name.tr}',
        ),
      ],
      otherWidget: [
        Row(
          children: [
            Text(
              TranslationKey.members.name.tr,
              style: Get.textTheme.bodyLarge,
            ),
            const Text(':'),
            const SizedBox(width: 8),
            Obx(
              () => Text(controller.members.length.toString(),
                  style: Get.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  )),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () async {
                final result = await Get.toNamed(
                  AppRoutes.membres,
                  arguments: CollectionsArguments(
                    isOnlySelectionMode: true,
                    preSelectedId: controller.members.map((e) => e.id).toList(),
                  ),
                );

                if (result != null && result is CollectionsResult<Member>) {
                  controller.addMembers(result.objects);
                }
              },
              child: Text(
                  '${TranslationKey.add.name.tr} ${TranslationKey.member.name.tr.toLowerCase()}'),
            )
          ],
        ),
      ],
      bfFormButtons: BfFormButtons(
        isDeleteButtonVisible: controller.isEditing,
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
