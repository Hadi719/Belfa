import 'package:get/get.dart';

import 'controller.dart';

class FirstLaunchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FirstLaunchController>(() => FirstLaunchController());
  }
}
