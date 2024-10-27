import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'core/route/app_pages.dart';
import 'services/user_preferences_service.dart';
import 'utils/localization/belfa_translations.dart';

class BelfaApp extends StatelessWidget {
  const BelfaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Belfa',
      locale: Locale(Get.find<UserPreferencesService>().languageCode.value),
      supportedLocales: const [Locale('en'), Locale('fa')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      fallbackLocale: const Locale('en'),
      translations: BelfaTraslations(),
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: Get.find<UserPreferencesService>().prefersDarkMode.value
          ? ThemeMode.dark
          : ThemeMode.light,
      initialRoute: AppRoutes.initialRoute,
      getPages: AppPages.pages,
    );
  }
}
