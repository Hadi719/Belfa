import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/localization/translation/translation_keys.dart';
import '../../utils/route/app_pages.dart';
import '../../utils/widget/bf_app_bar.dart';
import '../../utils/widget/bf_search_widget.dart';
import 'controller.dart';
import 'model/result.dart';

class MemberOverviewScreen extends StatelessWidget {
  const MemberOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MemberOverviewController controller = Get.find();
    return Scaffold(
      appBar: bfAppBar(
        appBarTitle: TranslationKey.members.name.tr,
        leading: GetX<MemberOverviewController>(
          builder: (_) => Visibility(
            visible: controller.isSelectionMode.value,
            child: IconButton(
              onPressed: controller.areAllMembersSelected
                  ? null
                  : controller.selectAllMembers,
              icon: const Icon(Icons.select_all),
            ),
          ),
        ),
        actions: [
          GetX<MemberOverviewController>(
            builder: (_) => Visibility(
              visible: controller.isOnlySelectionMode.value,
              replacement: Visibility(
                visible: controller.isSelectionMode.value,
                child: IconButton(
                  onPressed: controller.disableSelectionMode,
                  icon: const Icon(Icons.clear),
                ),
              ),
              child: IconButton(
                onPressed: controller.selectedMembers.isEmpty
                    ? null
                    : controller.deselectAllMembers,
                icon: const Icon(Icons.deselect),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            BfSearchWidget(
              controller: controller.searchController,
              searchQuery: controller.searchQuery,
              onChanged: (value) => controller.searchQuery.value = value,
              onPressedClear: () {
                controller.searchQuery.value = '';
                controller.searchController.clear();
                controller.loadMembers();
              },
            ),
            Expanded(
              child: GetX<MemberOverviewController>(
                builder: (_) {
                  return ListView.builder(
                    itemCount: controller.displayedMembers.length,
                    itemBuilder: (context, index) {
                      final member = controller.displayedMembers[index];
                      return GetX<MemberOverviewController>(
                        builder: (_) {
                          return Card(
                            elevation: 8.0,
                            child: ListTile(
                              title: Text(
                                  '${member.name ?? ''} ${member.lastName ?? ''}'),
                              subtitle: Text(member.phoneNumber ?? ''),
                              leading: Visibility(
                                visible: controller.isSelectionMode.value,
                                child: Checkbox(
                                  value: controller.selectedMembers
                                      .contains(member),
                                  onChanged: controller.isSelectionMode.value
                                      ? (bool? value) {
                                          controller
                                              .toggleMemberSelection(member);
                                        }
                                      : null,
                                ),
                              ),
                              trailing: Visibility(
                                visible: controller.isSelectionMode.value,
                                child: IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {
                                    Get.defaultDialog(
                                      title: TranslationKey.delete.name.tr,
                                      titleStyle:
                                          Get.textTheme.titleMedium?.copyWith(
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
                                            style: Get.textTheme.bodyLarge
                                                ?.copyWith(
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  Get.theme.colorScheme.scrim,
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
                              ),
                              onLongPress: () =>
                                  controller.onLongPressMember(member),
                              onTap: controller.isSelectionMode.value
                                  ? () =>
                                      controller.toggleMemberSelection(member)
                                  : () => Get.toNamed(
                                        AppRoutes.memberForm,
                                        arguments: member,
                                      ),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (controller.isOnlySelectionMode.value) {
            Get.back(
                result: MemberOverviewResult(
              members: controller.selectedMembers,
            ));
            return;
          }
          Get.toNamed(AppRoutes.memberForm);
        },
        child: GetX<MemberOverviewController>(
          builder: (_) => Icon(
            controller.isOnlySelectionMode.value ? Icons.done : Icons.add,
          ),
        ),
      ),
    );
  }
}
