import 'package:get/get.dart';

import '../../repositories/member_repository.dart';
import 'controller.dart';

class MemberOverviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MemberRepository().init()); // Initialize lazily
    Get.lazyPut(() => MemberOverviewController(Get.find<MemberRepository>()));
  }
}
