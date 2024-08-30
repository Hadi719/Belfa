import 'package:isar/isar.dart';

part 'my_app_settings.g.dart';

@Collection()
class MyAppSettings {
  final Id id = 0;
  bool isAdmin = false;
  bool isDarkMode = false;
}
