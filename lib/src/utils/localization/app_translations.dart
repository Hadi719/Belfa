import 'package:get/get.dart';

import 'translation/en.dart';
import 'translation/fa.dart';

class AppTraslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': EnTranslations().toMap(),
        'fa': FaTranslations().toMap(),
      };
}
