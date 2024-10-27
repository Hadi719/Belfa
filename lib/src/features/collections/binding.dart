import 'package:get/get.dart';

import 'controller.dart';

class CollectionViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GroupsCollectionController>(() => GroupsCollectionController());
    Get.lazyPut<MembersCollectionController>(
        () => MembersCollectionController());
    Get.lazyPut<LoansCollectionController>(() => LoansCollectionController());
    Get.lazyPut<InstallmentsCollectionController>(
        () => InstallmentsCollectionController());
  }
}
