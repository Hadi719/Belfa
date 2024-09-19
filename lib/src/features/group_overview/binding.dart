import 'package:get/get.dart';

import 'controller.dart';

class GroupOverviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GroupOverviewController>(() => GroupOverviewController());
  }
}
