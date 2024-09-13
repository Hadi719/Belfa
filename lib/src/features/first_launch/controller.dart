import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/user_preferences_service.dart';

class FirstLaunchController extends GetxController {
  final RxInt currentStep = 0.obs;

  /// Be carful steps starts at 0
  final RxInt maxStep = 2.obs;

  late final UserPreferencesService ups;

  @override
  void onInit() {
    super.onInit();
    ups = Get.find<UserPreferencesService>();
  }

  void onStepTapped(int step) {
    currentStep.value = step;
    update();
  }

  void onStepContinue() {
    if (currentStep.value == maxStep.value) {
      return;
      // Todo: go to next screen
      // Get.to()
    }
    currentStep.value++;
    currentStep.value.clamp(0, maxStep.value);
    update();
  }

  void onStepCancel() {
    if (currentStep.value == 0) return;
    if (currentStep.value > 0) {
      currentStep.value--;
    }
    currentStep.value.clamp(0, maxStep.value);
    update();
  }

  void updateLocale({
    required String languageCode,
    String? countryCode,
  }) {
    ups.updateUserLocale(languageCode: languageCode, countryCode: countryCode);
    Get.updateLocale(Locale(languageCode, countryCode));
  }

  void toggleThemeMode() {
    ups.toggleUserDarkModePreference();
    Get.changeThemeMode(
      ups.prefersDarkMode.value ? ThemeMode.dark : ThemeMode.light,
    );
    update();
  }

  void toggleUserStatus() {
    ups.toggleUserAdminStatus();
    update();
  }
}
