import 'dart:async';

import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:logging/logging.dart';

import '../model/user_preferences.dart';
import 'isar_service.dart';

Logger log = Logger('services.preferences');

/// Provides access to and manages user preferences stored in the database.
class UserPreferencesService extends GetxService {
  /// Indicates whether the user has admin privileges.
  late RxBool hasAdminAccess;

  /// Indicates whether the user is logged in.
  late RxBool isLoggedIn;

  /// Indicates whether the user prefers dark mode.
  late RxBool prefersDarkMode;

  /// Indicates whether this is the first time the user has opened the app.
  late RxBool isFirstLaunch;

  /// The user's selected language code.
  late RxString languageCode;

  /// The user's selected country code (can be null).
  late Rx<String?> countryCode;

  late final IsarCollection<UserPreferences> _prefsCollection;

  late final Isar _isar;

  /// Initializes the service by loading user preferences from the database.
  Future<UserPreferencesService> init() async {
    log.info('Initializing user preferences service...');

    try {
      _isar = Get.find<IsarService>().isar;
      _prefsCollection = _isar.userPreferences;
      final preferences = await _loadPreferences();

      hasAdminAccess = preferences.hasAdminAccess.obs;
      isLoggedIn = preferences.isLoggedIn.obs;
      prefersDarkMode = preferences.prefersDarkMode.obs;
      isFirstLaunch = preferences.isFirstLaunch.obs;
      languageCode = preferences.languageCode.obs;
      countryCode = preferences.countryCode.obs;

      log.info('User preferences service initialized.');
    } catch (e) {
      log.severe('Failed to initialize user preferences service: $e', [e]);
      rethrow;
    }

    return this;
  }

  /// Loads user preferences from the database.
  Future<UserPreferences> _loadPreferences() async {
    return await _prefsCollection.get(0) ?? UserPreferences();
  }

  /// Persists the provided user preferences to the database.
  Future<void> _savePreferences({
    bool? hasAdminAccess,
    bool? prefersDarkMode,
    bool? isFirstLaunch,
    bool? isLoggedIn,
    String? languageCode,
    String? countryCode,
  }) async {
    log.info('Saving app settings...');

    final prefs = await _loadPreferences();

    _isar.writeTxn(() async {
      _prefsCollection.put(
        UserPreferences()
          ..hasAdminAccess = hasAdminAccess ?? prefs.hasAdminAccess
          ..isFirstLaunch = isFirstLaunch ?? prefs.isFirstLaunch
          ..isLoggedIn = isLoggedIn ?? prefs.isLoggedIn
          ..prefersDarkMode = prefersDarkMode ?? prefs.prefersDarkMode
          ..languageCode = languageCode ?? prefs.languageCode
          ..countryCode = countryCode ?? prefs.countryCode,
      );
    });
  }

  /// Deletes user preferences from the database.
  Future<void> deletePreferences() async {
    await _prefsCollection.delete(UserPreferences().id);
  }

  /// Updates the user's admin status and persists the change.
  Future<void> updateUserAdminStatus({required bool hasAdminAccess}) async {
    log.info('Updating user admin status...');

    this.hasAdminAccess.value = hasAdminAccess;
    unawaited(_savePreferences(hasAdminAccess: hasAdminAccess));
  }

  /// Updates the user's login status and persists the change.
  Future<void> updateUserLoginStatus({required bool isLoggedIn}) async {
    log.info('Updating user login status...');

    this.isLoggedIn.value = isLoggedIn;
    unawaited(_savePreferences(isLoggedIn: isLoggedIn));
  }

  /// Updates the user's dark mode preference and persists the change.
  Future<void> updateUserDarkModePreference(
      {required bool prefersDarkMode}) async {
    log.info('Updating user dark mode preference...');

    this.prefersDarkMode.value = prefersDarkMode;
    unawaited(_savePreferences(prefersDarkMode: prefersDarkMode));
  }

  /// Updates the flag indicating the first time the app is launched and persists the change.
  Future<void> updateUserFirstLaunchUse({required bool isFirstLaunch}) async {
    log.info('Updating first time app launch status...');

    this.isFirstLaunch.value = isFirstLaunch;
    unawaited(_savePreferences(isFirstLaunch: isFirstLaunch));
  }

  /// Updates the user's locale and persists the change.
  Future<void> updateUserLocale({
    required String languageCode,
    String? countryCode,
  }) async {
    log.info('Updating user locale...');

    this.languageCode.value = languageCode;
    this.countryCode.value = countryCode;
    unawaited(_savePreferences(
      languageCode: languageCode,
      countryCode: countryCode,
    ));
  }
}
