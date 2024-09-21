import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/localization/translation/translation_keys.dart';
import '../../utils/route/app_pages.dart';
import 'controller.dart';

/// Widget displaying a list of members.
class MemberOverviewScreen extends GetView<MemberOverviewController> {
  const MemberOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TranslationKey.members.name.tr),
        elevation: 16.0,
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                controller.searchQuery.value = value;
              },
              decoration: InputDecoration(
                labelText: TranslationKey.search.name.tr,
                prefixIcon: const Icon(Icons.search),
              ),
            ),
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
