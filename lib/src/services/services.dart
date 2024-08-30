import 'package:get/get.dart';
import 'package:logging/logging.dart';

import 'app_settings_service.dart';
import 'isar_service.dart';

Logger log = Logger('main.services');

Future<void> initServices() async {
  log.info('Starting Services...');

  await Get.putAsync(() => IsarService().init());
  await Get.putAsync(() => AppSettingsService().init());

  log.info('Services initialized successfully.');
}
