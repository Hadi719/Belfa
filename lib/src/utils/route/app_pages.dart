import 'package:get/get.dart';

import '../../features/first_launch/index.dart';
import '../../features/group_overview/index.dart';
import '../../features/member_form/index.dart';
import '../../features/member_overview/index.dart';

class AppRoutes {
  static const String initialRoute = memberOverview;
  static const String firstLaunch = '/first-launch';
  static const String groupOverview = '/group-overview';
  static const String memberOverview = '/member-overview';
  static const String memberForm = '/member-form';
}

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.firstLaunch,
      page: () => const FirstLaunchScreen(),
      binding: FirstLaunchBinding(),
    ),
    GetPage(
      name: AppRoutes.groupOverview,
      page: () => const GroupOverviewScreen(),
      binding: GroupOverviewBinding(),
    ),
    GetPage(
      name: AppRoutes.memberOverview,
      page: () => const MemberOverviewScreen(),
      binding: MemberOverviewBinding(),
    ),
    GetPage(
      name: AppRoutes.memberForm,
      page: () => const MemberFormScreen(),
      binding: MemberFormBinding(),
    ),
  ];
}
