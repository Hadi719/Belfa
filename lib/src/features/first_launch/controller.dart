import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../services/user_preferences_service.dart';

class FirstLaunchController extends GetxController {
  final RxInt currentStep = 0.obs;

  /// Be carful steps starts at 0
  final RxInt maxStep = 0.obs;

  late final UserPreferencesService ups;

  @override
  void onInit() {
    super.onInit();
    ups = Get.find<UserPreferencesService>();
  }

  void updateLocale({
    required String languageCode,
    String? countryCode,
  }) {
    ups.updateUserLocale(languageCode: languageCode, countryCode: countryCode);
    Get.updateLocale(Locale(languageCode, countryCode));
  }
}
