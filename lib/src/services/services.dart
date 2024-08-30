import 'package:get/get.dart';
import 'package:logging/logging.dart';

import 'isar_service.dart';
import 'setting_service.dart';

Logger log = Logger('main.services');

Future<void> initServices() async {
  log.info('Starting Services...');

  await Get.putAsync(() => IsarService().init());
  await Get.putAsync(() => SettingsService().init());


  log.info('All services started...');
}
