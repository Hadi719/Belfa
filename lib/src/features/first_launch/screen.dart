import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/localization/translation/translation_keys.dart';
import '../../utils/route/app_pages.dart';
import 'widget/bf_stepper.dart';

class FirstLaunchScreen extends StatelessWidget {
  const FirstLaunchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(TranslationKey.appTitle.name.tr),
          centerTitle: true,
          elevation: 24,
        ),
        body: const BfStepper(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Todo: go to next screen
            Get.offNamed(AppRoutes.groupOverview);
          },
          child: const Icon(Icons.done),
        ));
  }
}
