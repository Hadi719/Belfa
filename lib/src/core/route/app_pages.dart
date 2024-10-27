import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../development/src/dev_screen.dart';
import '../../features/collections/index.dart';
import '../../features/first_launch/index.dart';
import '../../features/group_form/index.dart';
import '../../features/member_form/index.dart';
import '../../models/isar/index.dart';

class AppRoutes {
  static const String initialRoute = membres;

  static const String firstLaunch = '/first-launch';

  static const String home = '/';

  // Collections
  static const String collection = '/collection';
  static const String groups = '$collection/groups';
  static const String membres = '$collection/members';
  static const String loans = '$collection/loans';
  static const String installments = '$collection/installments';

  // Forms
  static const String form = '/form';
  static const String groupForm = '$form/group';
  static const String memberForm = '$form/member';
  static const String loanForm = '$form/loan';
  static const String installmentForm = '$form/installment';

  // Dev
  static const String dev = '/dev';
}

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.firstLaunch,
      page: () => const FirstLaunchScreen(),
      binding: FirstLaunchBinding(),
    ),
    GetPage(
      name: AppRoutes.groups,
      page: () => CollectionsScreen<Group, GroupsCollectionController>(
        editableRoute: AppRoutes.groupForm,
      ),
      binding: CollectionViewBinding(),
    ),
    GetPage(
      name: AppRoutes.membres,
      page: () => CollectionsScreen<Member, MembersCollectionController>(
        editableRoute: AppRoutes.memberForm,
      ),
      binding: CollectionViewBinding(),
    ),
    GetPage(
      name: AppRoutes.loans,
      page: () => CollectionsScreen<Loan, LoansCollectionController>(
        editableRoute: AppRoutes.loanForm,
      ),
      binding: CollectionViewBinding(),
    ),
    GetPage(
      name: AppRoutes.installments,
      page: () =>
          CollectionsScreen<Installment, InstallmentsCollectionController>(
        editableRoute: AppRoutes.installmentForm,
      ),
      binding: CollectionViewBinding(),
    ),
    GetPage(
      name: AppRoutes.groupForm,
      page: () => const GroupFormScreen(),
      binding: GroupFormBinding(),
    ),
    GetPage(
      name: AppRoutes.memberForm,
      page: () => const MemberFormScreen(),
      binding: MemberFormBinding(),
    ),
    if (kDebugMode)
      GetPage(
        name: AppRoutes.dev,
        page: () => const DevScreen(),
      ),
  ];
}
