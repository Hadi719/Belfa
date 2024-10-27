import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';

import '../controller.dart';

/// A button that manages selection mode based on the state of the
/// [CollectionsController].
///
/// It displays one of three icons based on the current state:
/// - **Deselect All (Only Selection Mode):** When in only selection mode and
///   items are selected, displays a "deselect all" icon.
/// - **Clear Selection (Selection Mode):** When in selection mode (but not
///   exclusively), displays a "clear selection" icon.
/// - **Hidden:** When not in selection mode, the button is hidden.
class BelfaSelectionModeButton<C extends CollectionsController>
    extends StatelessWidget {
  const BelfaSelectionModeButton({
    super.key,
    required this.controller,
  });

  /// The controller that manages the selection state.
  final C controller;

  @override
  Widget build(BuildContext context) {
    return GetX<C>(
      builder: (_) => Visibility(
        visible: controller.isOnlySelectionMode.value ||
            controller.isSelectionMode.value,
        child: IconButton(
          onPressed: () => controller.isOnlySelectionMode.value
              ? controller.deselectAll()
              : controller.disableSelection(),
          icon: Icon(controller.isOnlySelectionMode.value
              ? Icons.deselect
              : Icons.clear),
        ),
      ),
    );
  }
}

/// A button that selects all items in the list.
///
/// This button is only visible in selection mode.
class BelfaSelectAllButton<C extends CollectionsController>
    extends StatelessWidget {
  const BelfaSelectAllButton({
    super.key,
    required this.controller,
  });

  /// The controller that manages the selection state.
  final C controller;

  @override
  Widget build(BuildContext context) {
    return GetX<C>(
      builder: (_) => Visibility(
        visible: controller.isSelectionMode.value,
        child: IconButton(
          onPressed:
              controller.isAllSelected.value ? null : controller.selectAll,
          icon: const Icon(Icons.select_all),
        ),
      ),
    );
  }
}
