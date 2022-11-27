import 'package:get/get.dart';
import 'package:my_app_waleed/logic/controller/cart_controller.dart';
import 'package:my_app_waleed/logic/controller/category_controller.dart';
import 'package:my_app_waleed/logic/controller/product_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductController());

    Get.lazyPut(() => CartController());
    Get.put(CategoryController());
  }
}
