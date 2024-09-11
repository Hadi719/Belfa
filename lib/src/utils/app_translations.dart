import 'package:get/get.dart';

class AppTraslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'app_title': 'Apcha',
          'admin': 'Admin',
          'user': 'User',
          'change_locale': 'Change Locale',
          'dark_mode': 'Dark Mode',
          'light_mode': 'Light Mode',
          'fa': 'Farsi',
          'en': 'English',
          'IR': 'Iran',
          'US': 'United States',
          'language': 'Language',
          'country': 'Country',
        },
        'fa_IR': {
          'app_title': 'اپچا',
          'admin': 'مدیر',
          'user': 'کاربر',
          'change_locale': 'تغییر زبان',
          'dark_mode': 'حالت تیره',
          'light_mode': 'حالت روشن',
          'fa': 'فارسی',
          'en': 'انگلیسی',
          'IR': 'ایران',
          'US': 'ایالات متحده آمریکا',
          'language': 'زبان',
          'country': 'کشور'
        }
      };
}
