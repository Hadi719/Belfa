import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/localization/translation/en.dart';
import '../../../utils/localization/translation/fa.dart';
import '../../../utils/localization/translation/translation_keys.dart';
import '../controller.dart';

class BelfaStepper extends StatelessWidget {
  const BelfaStepper({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GetBuilder<FirstLaunchController>(
        builder: (controller) => Stepper(
          currentStep: controller.currentStep.value,
          onStepTapped: (step) => controller.onStepTapped(step),
          onStepContinue: controller.onStepContinue,
          onStepCancel: controller.onStepCancel,
          controlsBuilder: _controlsBuilder,
          // stepIconBuilder: (stepIndex, stepState) {
          //   Icon stepIcon = const Icon(Icons.translate);
          //   if (stepIndex == 1) {
          //     stepIcon = const Icon(Icons.settings_brightness);
          //   }
          //   return stepIcon;
          // },
          connectorColor: WidgetStateProperty.resolveWith<Color>(
            (Set<WidgetState> states) {
              return Get.theme.colorScheme.secondaryContainer;
              // if (controller.ups.prefersDarkMode.value) {
              //   return Colors.greenAccent;
              // }
              // return Colors.blueAccent;
            },
          ),
          steps: [
            _buildLanguageSelectionStep(controller),
            _buildThemeModeSelectionStep(controller),
            _buildUserSelectionStep(controller),
          ],
        ),
      ),
    );
  }

  Widget _controlsBuilder(BuildContext context, ControlsDetails details) {
    return Row(
      children: <Widget>[
        FilledButton(
          onPressed: details.onStepContinue,
          child: Text(TranslationKey.next.name.tr),
        ),
        const SizedBox(width: 8),
        Visibility(
          visible: details.currentStep > 0,
          child: ElevatedButton(
            onPressed: details.onStepCancel,
            child: Text(TranslationKey.previous.name.tr),
          ),
        ),
      ],
    );
  }

  Step _buildLanguageSelectionStep(FirstLaunchController controller) {
    String secondLanguage =
        controller.ups.languageCode.value == TranslationKey.en.name
            ? FaTranslations().language
            : EnTranslations().language;

    return Step(
      title: Row(
        children: [
          Text(TranslationKey.language.name.tr),
          const Text(' / '),
          Text(secondLanguage),
        ],
      ),
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

  Step _buildThemeModeSelectionStep(FirstLaunchController controller) {
    return Step(
      title: Text(TranslationKey.themeMode.name.tr),
      content: Switch(
        value: controller.ups.prefersDarkMode.value,
        onChanged: (bool newValue) {
          controller.toggleThemeMode();
        },
        thumbIcon: WidgetStateProperty.resolveWith<Icon?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.selected)) {
              return const Icon(Icons.dark_mode);
            }
            return const Icon(Icons.light_mode);
          },
        ),
      ),
    );
  }

  Step _buildUserSelectionStep(FirstLaunchController controller) {
    return Step(
      title: Text(TranslationKey.userStatus.name.tr),
      content: Column(
        children: [
          _buildUserRadio(TranslationKey.user.name.tr, false, controller),
          _buildUserRadio(TranslationKey.admin.name.tr, true, controller),
        ],
      ),
    );
  }

  RadioListTile<bool> _buildUserRadio(
    String title,
    bool isAdmin,
    FirstLaunchController controller,
  ) {
    return RadioListTile<bool>(
      title: Text(title),
      value: isAdmin,
      groupValue: controller.ups.hasAdminAccess
          .value, // Assuming you have isAdmin in UserPreferencesService
      onChanged: (newValue) {
        if (newValue != null) {
          controller.toggleUserStatus();
        }
      },
    );
  }
}
