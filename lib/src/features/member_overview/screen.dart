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
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                controller.searchQuery = value;
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
                  return ListTile(
                    title: Text(member.name ?? ''),
                    subtitle: Text(member.phoneNumber ?? ''),
                    onTap: () => Get.toNamed(
                      AppRoutes.memberForm,
                      arguments: member,
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
