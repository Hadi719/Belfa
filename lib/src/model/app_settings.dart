import 'package:isar/isar.dart';

part 'app_settings.g.dart';

/// Represents the application's settings persisted in the database.
@collection
class AppSettings {
  /// The primary key for the settings object. Always set to 0.
  Id id = 0;

  /// Indicates whether the user has admin privileges.
  bool isAdmin = false;

  /// Indicates whether dark mode is enabled.
  bool isDarkMode = false;

  /// The selected language code (e.g., 'en', 'es').
  String languageCode = 'en';

  /// The selected country code (e.g., 'US', 'CA'), can be null.
  String? countryCode;
}
