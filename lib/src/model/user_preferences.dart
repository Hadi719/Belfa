import 'package:isar/isar.dart';

part 'user_preferences.g.dart';

/// Persistent user preferences and application settings.
@collection
class UserPreferences {
  /// The primary key for the settings object. Always set to 0.
  Id id = 0;

  /// Tracks if the app is being used for the first time.
  bool isFirstLaunch = true;

  /// Indicates whether the user has admin privileges.
  bool hasAdminAccess = false;

  /// Tracks the user's login status.
  bool isLoggedIn = false;

  /// Indicates whether the user prefers dark mode.
  bool prefersDarkMode = false;

  /// The selected language code (e.g., 'en', 'es').
  String languageCode = 'en';

  /// The selected country code (e.g., 'US', 'CA'), can be null.
  String? countryCode;
}
