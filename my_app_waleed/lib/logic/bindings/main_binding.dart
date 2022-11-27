import 'package:get/instance_manager.dart';
import 'package:my_app_waleed/logic/controller/main_controller.dart';
import 'package:my_app_waleed/logic/controller/payment_controller.dart';
import 'package:my_app_waleed/logic/controller/settings_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(SettingsController());
    Get.put(PayMentController(), permanent: true);
  }
}
