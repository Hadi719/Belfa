// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';

import '../../src/core/route/app_pages.dart';
import '../../src/models/isar/index.dart';
import '../../src/repositories/index.dart';
import '../../src/utils/widget/belfa_app_bar.dart';

class DevScreen extends StatelessWidget {
  const DevScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: belfaAppBar(
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
                await memRepo.insertObject(member);

                group.members.add(member);
                debugPrint(
                    '===> DevScreen: is Member added? ${group.members.length}');

                await grpRepo.insertObject(group);
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
      visible: Get.currentRoute != AppRoutes.membres,
      child: TextButton(
        onPressed: () => Get.toNamed(AppRoutes.membres),
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
      visible: Get.currentRoute != AppRoutes.groups,
      child: TextButton(
        onPressed: () => Get.toNamed(AppRoutes.groups),
        child: const Text('Gov'),
      ),
    ),
    Visibility(
      visible: Get.currentRoute != AppRoutes.form,
      child: TextButton(
        onPressed: () => Get.toNamed(AppRoutes.form),
        child: const Text('Gf'),
      ),
    ),
    Visibility(
      visible: Get.currentRoute != AppRoutes.dev,
      child: TextButton(
        onPressed: () => Get.toNamed(AppRoutes.dev),
        child: const Text('Dev'),
      ),
    ),
  ];
}
