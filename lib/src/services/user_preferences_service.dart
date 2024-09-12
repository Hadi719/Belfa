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
  late final RxBool hasAdminAccess;

  /// Indicates whether the user is logged in.
  late final RxBool isLoggedIn;

  /// Indicates whether the user prefers dark mode.
  late final RxBool prefersDarkMode;

  /// Indicates whether this is the first time the user has opened the app.
  late final RxBool isFirstLaunch;

  /// The user's selected language code.
  late final RxString languageCode;

  /// The user's selected country code (can be null).
  late final Rx<String?> countryCode;

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
  Future<bool> deletePreferences() async {
    log.info('Deleting preferences...');

    return _isar.writeTxn<bool>(() async {
      return await _prefsCollection.delete(UserPreferences().id);
    });
  }

  /// Toggles the user's admin status and persists the change.
  void toggleUserAdminStatus() async {
    log.info('Toggling user admin status...');

    hasAdminAccess.toggle();
    unawaited(_savePreferences(hasAdminAccess: hasAdminAccess.value));
  }

  /// Toggles the user's login status and persists the change.
  void toggleUserLoginStatus() {
    log.info('Toggling user login status...');

    isLoggedIn.toggle();
    unawaited(_savePreferences(isLoggedIn: isLoggedIn.value));
  }

  /// Toggles the user's dark mode preference and persists the change.
  void toggleUserDarkModePreference() {
    log.info('Toggling user dark mode preference...');

    prefersDarkMode.toggle();
    unawaited(_savePreferences(prefersDarkMode: prefersDarkMode.value));
  }

  /// Toggles the flag indicating the first time the app is launched and persists the change.
  void toggleUserFirstLaunchUse() {
    log.info('Toggling first time app launch status...');

    isFirstLaunch.toggle();
    unawaited(_savePreferences(isFirstLaunch: isFirstLaunch.value));
  }

  /// Updates the user's locale and persists the change.
  void updateUserLocale({
    required String languageCode,
    String? countryCode,
  }) {
    log.info('Updating user locale...');

    this.languageCode.value = languageCode;
    this.countryCode.value = countryCode;
    unawaited(_savePreferences(
      languageCode: languageCode,
      countryCode: countryCode,
    ));
  }
}
