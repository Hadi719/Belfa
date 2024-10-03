import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/localization/translation/translation_keys.dart';
import '../../utils/route/app_pages.dart';
import '../../utils/widget/bf_app_bar.dart';
import '../../utils/widget/bf_search_widget.dart';
import 'controller.dart';

/// Widget displaying a list of members.
class MemberOverviewScreen extends GetView<MemberOverviewController> {
  const MemberOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: bfAppBar(appBarTitle: TranslationKey.members.name.tr),
      body: Column(
        children: [
          BfSearchWidget(
            controller: controller.searchController,
            onChanged: (value) {
              controller.searchQuery.value = value;
            },
            onPressedClear: () {
              controller.searchQuery.value = '';
              controller.searchController.clear();
              controller.loadMembers();
            },
          ),
          // Member list
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: controller.members.length,
                itemBuilder: (context, index) {
                  final member = controller.members[index];
                  return Card(
                    child: ListTile(
                      title:
                          Text('${member.name ?? ''} ${member.lastName ?? ''}'),
                      subtitle: Text(member.phoneNumber ?? ''),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          Get.defaultDialog(
                            title: TranslationKey.delete.name.tr,
                            titleStyle: Get.textTheme.titleMedium?.copyWith(
                              color: Get.theme.colorScheme.error,
                            ),
                            content: Wrap(
                              spacing: 4.0,
                              alignment: WrapAlignment.center,
                              children: [
                                Text(
                                    '${TranslationKey.confirm.name.tr} ${TranslationKey.delete.name.tr} '),
                                Text(
                                  '${member.name ?? ''} ${member.lastName ?? ''}',
                                  style: Get.textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Get.theme.colorScheme.scrim,
                                  ),
                                ),
                                const Text('?'),
                              ],
                            ),
                            onConfirm: () async {
                              await controller.deleteMember(member);
                              Get.back();
                            },
                            onCancel: () => Get.back(),
                          );
                        },
                      ),
                      onTap: () => Get.toNamed(
                        AppRoutes.memberForm,
                        arguments: member,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      // Add new member button
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(AppRoutes.memberForm),
        child: const Icon(Icons.add),
      ),
    );
  }
}
