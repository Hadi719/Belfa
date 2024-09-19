import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'services/user_preferences_service.dart';
import 'utils/localization/app_translations.dart';
import 'utils/route/app_pages.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      translations: AppTraslations(),
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: Get.find<UserPreferencesService>().prefersDarkMode.value
          ? ThemeMode.dark
          : ThemeMode.light,
      initialRoute: AppRoutes.groupPerformance,
      getPages: AppPages.pages,
    );
  }
}
