import 'package:get/get.dart';
import 'package:isar/isar.dart';

import '../../model/db/group.dart';
import '../../model/db/loan.dart';
import '../../services/isar_service.dart';
import 'model/group_performance_data.dart';

class GroupPerformanceController extends GetxController {
  late final IsarService isarService;
  late final IsarCollection<Group> groupCollection;
  List<GroupPerformanceData> groupPerformanceData = [];

  @override
  void onInit() {
    super.onInit();
    isarService = Get.find<IsarService>();
    groupCollection = isarService.isar.groups;
    _loadGroupPerformanceData();
  }

  Future<void> _loadGroupPerformanceData() async {
    final groups = await groupCollection.where().findAll();
    groupPerformanceData = await Future.wait(
      groups.map((group) async {
        final activeLoans = await group.loans
            .filter()
            .loanStatusEqualTo(LoanStatus.active)
            .findAll();
        final averageLoanSize = activeLoans.isNotEmpty
            ? activeLoans
                    .map((loan) => loan.principalAmount!)
                    .reduce((a, b) => a + b) /
                activeLoans.length
            : 0.0;
        return GroupPerformanceData(
          group.name,
          activeLoans.length,
          averageLoanSize,
        );
      }),
    );

    update();
  }
}
