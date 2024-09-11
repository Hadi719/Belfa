import 'package:flutter/material.dart';

import 'app_log_handler.dart';
import 'src/my_app.dart';
import 'src/services/services.dart';

void main() async {
  // Ensure binding is initialized for native plugins.
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize and configure logging.
  final appLogHandler = await AppLogHandler().init();
  await appLogHandler.configureLogging();

  // Initialize app services.
  await initServices();

  // Run the application.
  runApp(const MyApp());
}
