/// TranslationKeys abstract class defines the contract for translation key
/// implementations. It ensures that all translation classes provide values
/// for the same set of keys.
abstract class TranslationsKeys {
  String get appTitle;
  String get appDescription;
  String get admin;
  String get user;
  String get changeLocale;
  String get darkMode;
  String get lightMode;
  String get fa;
  String get en;
  String get ir;
  String get us;
  String get language;
  String get country;
  String get continueBtn;
  String get cancel;
  String get skip;
  String get next;
  String get previous;

  /// toMap method converts the translation keys and their corresponding values
  /// into a map. This method should be implemented by concrete translation
  /// classes.
  Map<String, String> toMap() {
    return {
      'app_title': appTitle,
      'admin': admin,
      'user': user,
      'change_locale': changeLocale,
      'dark_mode': darkMode,
      'light_mode': lightMode,
      'fa': fa,
      'en': en,
      'IR': ir,
      'US': us,
      'language': language,
      'country': country,
      'continue': continueBtn,
      'cancel': cancel,
      'skip': skip,
      'next': next,
      'previous': previous,
    };
  }
}
