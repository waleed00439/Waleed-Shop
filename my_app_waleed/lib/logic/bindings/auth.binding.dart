import 'package:get/instance_manager.dart';
import 'package:my_app_waleed/logic/controller/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}
