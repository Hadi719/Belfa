import 'package:get/get.dart';

import '../../features/first_launch/bindings.dart';
import '../../features/first_launch/screen.dart';
import '../../features/group_performance/binding.dart';
import '../../features/group_performance/screen.dart';

class AppRoutes {
  static const String firstLaunch = '/first-launch';
  static const String groupPerformance = '/group-performance';
}

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.firstLaunch,
      page: () => const FirstLaunchScreen(),
      binding: FirstLaunchBinding(),
    ),
    GetPage(
      name: AppRoutes.groupPerformance,
      page: () => const GroupPerformanceScreen(),
      binding: GroupPerformanceBinding(),
    ),
  ];
}
