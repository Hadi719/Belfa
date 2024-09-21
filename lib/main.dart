import 'package:flutter/material.dart';

import 'src/core/dependency_injection.dart';
import 'src/my_app.dart';
import 'src/services/services.dart';
import 'src/utils/app_log_handler.dart';

Future<void> main() async {
  // Ensure Flutter bindings are initialized.
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize logging.
  final appLogHandler = await AppLogHandler().init();
  await appLogHandler.configureLogging();

  // Initialize app services.
  await initServices();

  // Initialize app dependencies.
  initDependencies();

  // Run the application.
  runApp(const MyApp());
}
