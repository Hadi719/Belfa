import 'package:get/get.dart';

import 'controller.dart';

class GroupPerformanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GroupPerformanceController>(() => GroupPerformanceController());
  }
}
