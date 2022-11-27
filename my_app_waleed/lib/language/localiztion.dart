import 'package:get/route_manager.dart';
import 'package:my_app_waleed/language/ar.dart';
import 'package:my_app_waleed/language/en.dart';
import 'package:my_app_waleed/language/fr.dart';
import 'package:my_app_waleed/utils/my_string.dart';

class LocaliztionApp extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        ene: en,
        ara: ar,
        frf: fr,
      };
}
