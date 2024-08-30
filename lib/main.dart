import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logging/logging.dart';

import 'src/services/services.dart';

Logger log = Logger('main');

void main() async {
  log.info('App Started...');

  WidgetsFlutterBinding.ensureInitialized();

  // Initializing services with GetX package.
  await initServices();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp();
  }
}
