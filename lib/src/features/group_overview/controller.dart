import 'package:get/get.dart';
import 'package:isar/isar.dart';

import '../../models/db/group.dart';
import '../../models/db/loan.dart';
import '../../services/isar_service.dart';
import 'model/group_overview_data.dart';

class GroupOverviewController extends GetxController {
  late final IsarService isarService;
  late final IsarCollection<Group> groupCollection;
  List<GroupOverviewData> groupOverviewData = [];

  @override
  void onInit() {
    super.onInit();
    isarService = Get.find<IsarService>();
    groupCollection = isarService.isar.groups;
    _loadGroupPerformanceData();
  }

  Future<void> _loadGroupPerformanceData() async {
    final groups = await groupCollection.where().findAll();
    groupOverviewData = await Future.wait(
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
        return GroupOverviewData(
          group.name,
          activeLoans.length,
          averageLoanSize,
        );
      }),
    );

    update();
  }
}
