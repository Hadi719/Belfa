import 'package:get/get.dart';

import 'controller.dart';

class MemberOverviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MemberOverviewController());
  }
}
