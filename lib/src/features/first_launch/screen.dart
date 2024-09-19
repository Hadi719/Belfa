import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/localization/translation/translation_keys.dart';
import '../../utils/route/app_pages.dart';
import 'widget/my_stepper.dart';

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
      body: Column(
        children: [
          const SizedBox(height: 64),
          const MyStepper(),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 64),
            child: FilledButton.tonal(
              onPressed: () {
                // Todo: go to next screen
                Get.toNamed(AppRoutes.memberForm);
              },
              child: Text(TranslationKey.start.name.tr),
            ),
          ),
        ],
      ),
    );
  }
}
