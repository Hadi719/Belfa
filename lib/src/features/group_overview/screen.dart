import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/localization/translation/translation_keys.dart';
import '../../utils/route/app_pages.dart';
import '../../utils/widget/bf_app_bar.dart';
import '../../utils/widget/bf_search_widget.dart';
import 'controller.dart';

class GroupOverviewScreen extends GetView<GroupOverviewController> {
  const GroupOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: bfAppBar(appBarTitle: TranslationKey.groups.name.tr),
      body: Column(
        children: [
          BfSearchWidget(
            controller: controller.searchController,
            searchQuery: controller.searchQuery,
            onChanged: (value) {
              controller.searchQuery.value = value;
            },
            onPressedClear: () {
              controller.searchQuery.value = '';
              controller.searchController.clear();
              controller.loadGroups();
            },
          ),
          // Group list
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: controller.groups.length,
                itemBuilder: (context, index) {
                  final group = controller.groups[index];
                  return Card(
                    child: ListTile(
                      title: Text(group.name),
                      subtitle: Text(group.members.length.toString()),
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
                                  group.name,
                                  style: Get.textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Get.theme.colorScheme.scrim,
                                  ),
                                ),
                                const Text('?'),
                              ],
                            ),
                            onConfirm: () async {
                              await controller.deleteGroup(group);
                              Get.back();
                            },
                            onCancel: () => Get.back(),
                          );
                        },
                      ),
                      onTap: () => Get.toNamed(
                        AppRoutes.groupForm,
                        arguments: group,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(AppRoutes.groupForm),
        child: const Icon(Icons.add),
      ),
    );
  }
}
