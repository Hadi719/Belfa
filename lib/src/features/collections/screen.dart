import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/isar/base/isar_model.dart';
import '../../utils/localization/translation/translation_keys.dart';
import '../../utils/widget/belfa_app_bar.dart';
import '../../utils/widget/belfa_search_widget.dart';
import 'controller.dart';
import 'models/arguments.dart';
import 'models/result.dart';
import 'widgets/buttons.dart';

class CollectionsScreen<T extends IsarModel, C extends CollectionsController<T>>
    extends StatelessWidget {
  const CollectionsScreen({
    super.key,
    // required this.viewableRoute,
    required this.editableRoute,
  });

  // final String viewableRoute;
  final String editableRoute;

  @override
  Widget build(BuildContext context) {
    final C controller = Get.find();
    return Scaffold(
      appBar: belfaAppBar(
        appBarTitle: controller.appBarTitle,
        leading: BelfaSelectAllButton(controller: controller),
        actions: [
          BelfaSelectionModeButton(controller: controller),
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
                controller.loadObjects();
              },
            ),
            _CollectionViewList<C>(
              controller: controller,
              // viewableRoute: viewableRoute,
              editableRoute: editableRoute,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (controller.isOnlySelectionMode.value) {
            Get.back(
                result: CollectionsResult<T>(
              objects: controller.selectedItems,
            ));
            return;
          }
          Get.toNamed(editableRoute);
        },
        child: GetX<C>(
          builder: (_) => Icon(
            controller.isOnlySelectionMode.value ? Icons.done : Icons.add,
          ),
        ),
      ),
    );
  }
}

class _CollectionViewList<C extends CollectionsController>
    extends StatelessWidget {
  const _CollectionViewList({
    required this.controller,
    // required this.viewableRoute,
    required this.editableRoute,
  });

  final C controller;
  // final String viewableRoute;
  final String editableRoute;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetX<C>(
        builder: (_) => ListView.builder(
          itemCount: controller.displayedItems.length,
          itemBuilder: (context, index) {
            final item = controller.displayedItems[index];
            return GetX<C>(
              builder: (_) {
                return Card(
                  child: ListTile(
                    title: Text(controller.getItemTitle(item)),
                    subtitle: Text(controller.getItemSubtitle(item)),
                    selected: controller.selectedItems.contains(item),
                    leading: Visibility(
                      visible: controller.isSelectionMode.value,
                      child: Checkbox(
                        value: controller.selectedItems.contains(item),
                        onChanged: controller.isSelectionMode.value
                            ? (bool? value) {
                                controller.toggleItemSelection(item);
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
                                  controller.getItemTitle(item),
                                  style: Get.textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Get.theme.colorScheme.scrim,
                                  ),
                                ),
                                const Text('?'),
                              ],
                            ),
                            onConfirm: () async {
                              await controller.deleteObject(item.id);
                              Get.back();
                            },
                            onCancel: () => Get.back(),
                          );
                        },
                      ),
                    ),
                    onLongPress: () => controller.handleLongPress(item),
                    onTap: controller.isSelectionMode.value
                        ? () => controller.toggleItemSelection(item)
                        : () => Get.toNamed(
                              // controller.isOnlySelectionMode.value
                              // ? viewableRoute :
                              editableRoute,
                              arguments: controller.isOnlySelectionMode.value
                                  ? CollectionsArguments(
                                      preSelectedId: [item.id],
                                      isOnlySelectionMode: true,
                                    )
                                  : item,
                            ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
