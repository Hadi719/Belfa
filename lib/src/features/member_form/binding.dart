import 'package:get/get.dart';

import '../member_overview/controller.dart';
import 'controller.dart';

class MemberFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MemberFormController());
    Get.lazyPut(() => MemberOverviewController());
  }
}
