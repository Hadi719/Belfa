import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class FirstLaunchScreen extends StatelessWidget {
  const FirstLaunchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GetBuilder<FirstLaunchController>(
          builder: (controller) => Stepper(
            currentStep: controller.currentStep.value,
            onStepTapped: (step) => controller.currentStep.value = step,
            onStepContinue: () {
              if (controller.currentStep.value < controller.maxStep.value) {
                controller.currentStep.value++;
              }
            },
            onStepCancel: () {
              if (controller.currentStep.value > 0) {
                controller.currentStep.value--;
              }
            },
            steps: [
              _buildLanguageSelectionStep(controller),
            ],
          ),
        ),
      ),
    );
  }

  Step _buildLanguageSelectionStep(FirstLaunchController controller) {
    return Step(
      title: Text('language'.tr),
      content: Column(
        children: [
          _buildLanguageRadio('en', controller),
          _buildLanguageRadio('fa', controller),
        ],
      ),
    );
  }

  RadioListTile<String> _buildLanguageRadio(
    String languageCode,
    FirstLaunchController controller,
  ) {
    return RadioListTile<String>(
      title: Text(languageCode.tr),
      value: languageCode,
      groupValue: controller.ups.languageCode.value,
      onChanged: (newValue) {
        if (newValue != null) {
          controller.updateLocale(
            languageCode: newValue,
          );
        }
      },
    );
  }
}
