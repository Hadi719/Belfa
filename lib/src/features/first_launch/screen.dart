import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/route/app_pages.dart';
import '../../utils/localization/translation/translation_keys.dart';
import 'widget/belfa_stepper.dart';

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
        body: const BelfaStepper(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Todo: go to next screen
            Get.offNamed(AppRoutes.home);
          },
          child: const Icon(Icons.done),
        ));
  }
}
