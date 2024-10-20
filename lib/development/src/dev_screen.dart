// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';

import '../../src/models/collections/group.dart';
import '../../src/models/collections/member.dart';
import '../../src/repositories/group_repository.dart';
import '../../src/repositories/member_repository.dart';
import '../../src/utils/route/app_pages.dart';
import '../../src/utils/widget/bf_app_bar.dart';

class DevScreen extends StatelessWidget {
  const DevScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: bfAppBar(
        appBarTitle: 'Dev Screen',
        actions: [..._routingButtons()],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text('This is a development screen'),
          ),
          TextButton(
            onPressed: () async {
              // MemberFormController ctrl =
              //     _getDependency(MemberFormController());

              GroupRepository grpRepo = Get.find<GroupRepository>();
              MemberRepository memRepo = Get.find<MemberRepository>();

              Member? member = await memRepo.collection.where().findFirst();
              Group? group = await grpRepo.collection.where().findFirst();

              debugPrint('===> DevScreen: is Member null? ${member == null}');
              debugPrint('===> DevScreen: is Group null? ${group == null}');

              if (member != null && group != null) {
                await memRepo.insertMember(member);

                group.members.add(member);
                debugPrint(
                    '===> DevScreen: is Member added? ${group.members.length}');

                await grpRepo.insertGroup(group);
                group = await grpRepo.collection.get(group.id);

                debugPrint(
                    '===> DevScreen: is Group updated? ${group?.members.length}');

                debugPrint('===> DevScreen: is finally done?');
              }

              // ctrl.dispose();
            },
            child: const Text('Add Members to Group'),
          ),
        ],
      ),
    );
  }
}

S _getDependency<S>(S dependency) {
  S ctrl;
  if (Get.isRegistered<S>()) {
    ctrl = Get.find<S>();
  } else {
    ctrl = Get.put<S>(dependency);
  }
  return ctrl;
}

List<Widget> _routingButtons() {
  return [
    Visibility(
      visible: Get.currentRoute != AppRoutes.memberOverview,
      child: TextButton(
        onPressed: () => Get.toNamed(AppRoutes.memberOverview),
        child: const Text('Mov'),
      ),
    ),
    Visibility(
      visible: Get.currentRoute != AppRoutes.memberForm,
      child: TextButton(
        onPressed: () => Get.toNamed(AppRoutes.memberForm),
        child: const Text('Mf'),
      ),
    ),
    Visibility(
      visible: Get.currentRoute != AppRoutes.groupOverview,
      child: TextButton(
        onPressed: () => Get.toNamed(AppRoutes.groupOverview),
        child: const Text('Gov'),
      ),
    ),
    Visibility(
      visible: Get.currentRoute != AppRoutes.groupForm,
      child: TextButton(
        onPressed: () => Get.toNamed(AppRoutes.groupForm),
        child: const Text('Gf'),
      ),
    ),
    Visibility(
      visible: Get.currentRoute != AppRoutes.devScreen,
      child: TextButton(
        onPressed: () => Get.toNamed(AppRoutes.devScreen),
        child: const Text('Dev'),
      ),
    ),
  ];
}
