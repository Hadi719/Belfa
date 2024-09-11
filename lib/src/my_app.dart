import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'utils/app_translations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Apcha',
      fallbackLocale: const Locale('en', 'US'),
      translations: AppTraslations(),
      home: const Placeholder(),
    );
  }
}
