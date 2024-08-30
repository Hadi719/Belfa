import 'dart:async';

import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:logging/logging.dart';

import '../model/app_settings.dart';
import 'isar_service.dart';

Logger log = Logger('main.services.settings');

/// Manages application settings persisted in the database.
class AppSettingsService extends GetxService {
  /// Indicates whether the user has admin privileges.
  late RxBool isAdmin;

  /// Indicates whether dark mode is enabled.
  late RxBool isDarkMode;

  /// The selected language code.
  late RxString languageCode;

  /// The selected country code (can be null).
  late Rx<String?> countryCode;

  late final IsarCollection<AppSettings> _appSettingsCollection;

  /// Initializes the app settings service by loading settings from the database.
  Future<AppSettingsService> init() async {
    log.info('Initializing app settings...');

    try {
      _appSettingsCollection = Get.find<IsarService>().isar.appSettings;
      final settings = await _loadSettings();

      isAdmin = settings.isAdmin.obs;
      isDarkMode = settings.isDarkMode.obs;
      languageCode = settings.languageCode.obs;
      countryCode = settings.countryCode.obs;

      log.info('App settings initialized.');
    } catch (e) {
      log.severe('Failed to initialize app settings: $e', [e]);
      rethrow;
    }

    return this;
  }

  /// Loads app settings from the database.
  Future<AppSettings> _loadSettings() async {
    return await _appSettingsCollection.get(0) ?? AppSettings();
  }

  /// Saves the provided app settings to the database.
  Future<void> _saveSettings({
    bool? isAdmin,
    bool? isDarkMode,
    String? languageCode,
    String? countryCode,
  }) async {
    log.info('Saving app settings...');

    final settings = await _loadSettings();

    unawaited(_appSettingsCollection.put(AppSettings()
      ..isAdmin = isAdmin ?? settings.isAdmin
      ..isDarkMode = isDarkMode ?? settings.isDarkMode
      ..languageCode = languageCode ?? settings.languageCode
      ..countryCode = countryCode ?? settings.countryCode));
  }

  /// Updates the user's admin status and saves the change.
  Future<void> updateUserAdminStatus(bool isAdmin) async {
    log.info('Updating user admin status...');

    this.isAdmin.value = isAdmin;
    unawaited(_saveSettings(isAdmin: isAdmin));
  }

  /// Updates the theme mode and saves the change.
  Future<void> updateThemeMode(bool isDarkMode) async {
    log.info('Updating theme mode...');

    this.isDarkMode.value = isDarkMode;
    unawaited(_saveSettings(isDarkMode: isDarkMode));
  }

  /// Updates the locale and saves the change.
  Future<void> updateLocale(String languageCode, String? countryCode) async {
    log.info('Updating locale...');

    this.languageCode.value = languageCode;
    this.countryCode.value = countryCode;
    unawaited(_saveSettings(
      languageCode: languageCode,
      countryCode: countryCode,
    ));
  }
}
