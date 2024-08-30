import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'src/services/services.dart';

void main() async {
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
