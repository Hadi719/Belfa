import 'package:get/get.dart';

import 'controller.dart';

class GroupFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GroupFormController());
  }
}
