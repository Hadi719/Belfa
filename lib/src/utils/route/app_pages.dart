import 'package:get/get.dart';

import '../../features/first_launch/bindings.dart';
import '../../features/first_launch/screen.dart';
import '../../features/group_overview/binding.dart';
import '../../features/group_overview/screen.dart';
import '../../features/member_form/binding.dart';
import '../../features/member_form/screen.dart';

class AppRoutes {
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
    // GetPage(
    //   name: AppRoutes.memberOverview,
    //   page: () => const MemberOverviewScreen(),
    //   binding: MemberOverviewBinding(),
    // ),
    GetPage(
      name: AppRoutes.memberForm,
      page: () => const MemberFormScreen(),
      binding: MemberFormBinding(),
    ),
  ];
}
