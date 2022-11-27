import 'package:get/get.dart';
import 'package:my_app_waleed/view/screen/category_screen.dart';
import 'package:my_app_waleed/view/screen/favoites_screen.dart';
import 'package:my_app_waleed/view/screen/home_screen.dart';
import 'package:my_app_waleed/view/screen/settongs_screen.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  final tabs = [
    HomeScreen(),
    CategoryScreen(),
    FavoitesScreen(),
    SettongsScreen(),
  ].obs;

  final title = ["Waleed Shop", "Categories", "Favourites", "Settings"].obs;
}
