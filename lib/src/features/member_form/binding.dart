import 'package:get/get.dart';

import 'controller.dart';

class MemberFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MemberFormController());
  }
}
