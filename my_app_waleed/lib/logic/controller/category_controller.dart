import 'package:get/get.dart';
import 'package:my_app_waleed/modle/product_model.dart';
import 'package:my_app_waleed/service/category_service.dart';

class CategoryController extends GetxController {
  var categoryNameList = <String>[].obs;

  var categoryList = <Welcome>[].obs;

  var isCategoryLoading = false.obs;
  var isAllCategorys = false.obs;

  List<String> imageCategory = [
    "https://fakestoreapi.com/img/61U7T1koQqL._AC_SX679_.jpg",
    "https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg",
    "https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg",
    "https://fakestoreapi.com/img/61pHAEJ4NML._AC_UX679_.jpg",
  ].obs;

  @override
  void onInit() {
    super.onInit();
    getCategorys();
  }

  void getCategorys() async {
    var categoryName = await CategoryServices.getCategory();

    try {
      isCategoryLoading(true);
      if (categoryName.isNotEmpty) {
        categoryNameList.addAll(categoryName);
      }
    } finally {
      isCategoryLoading(false);
    }
  }

  getAllCategorys(String namecategory) async {
    isAllCategorys(true);
    categoryList.value =
        await AllCategorySercvises.getAllCategory(namecategory);

    isAllCategorys(false);
  }

  getCategoryIndex(int index) async {
    var categoryAllName = await getAllCategorys(categoryNameList[index]);

    if (categoryAllName != null) {
      categoryList.value = categoryAllName;
    }
  }
}
