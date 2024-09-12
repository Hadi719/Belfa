import 'package:get/get.dart';

import '../../features/first_launch/bindings.dart';
import '../../features/first_launch/screen.dart';

class AppRoutes {
  static const String firstLaunch = '/'; //'/first-launch';
}

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.firstLaunch,
      page: () => const FirstLaunchScreen(),
      binding: FirstLaunchBinding(),
    ),
  ];
}
