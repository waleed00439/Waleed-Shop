import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app_waleed/modle/product_model.dart';

import '../../routes/routes.dart';
import '../../utils/theme.dart';

class CartController extends GetxController {
  var productsMap = {}.obs;

  void addProductToCart(Welcome welcome) {
    if (productsMap.containsKey(welcome)) {
      productsMap[welcome] += 1;
      productsMap.entries.map((e) => e.key.price * e.value);
    } else {
      productsMap[welcome] = 1;
    }
  }

  void removeProductsFarmCart(Welcome welcome) {
    if (productsMap.containsKey(welcome) && productsMap[welcome] == 1) {
      productsMap.removeWhere((key, value) => key == welcome);
    } else {
      productsMap[welcome] -= 1;
    }
  }

  void removeOneProduct(Welcome welcome) {
    productsMap.removeWhere((key, value) => key == welcome);
  }

  void clearAllProducts() {
    Get.defaultDialog(
      title: "Clear Products",
      titleStyle: TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      middleText: 'are you sure you need Clear products',
      middleTextStyle: TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: Colors.grey,
      radius: 10,
      textCancel: " No ",
      cancelTextColor: Colors.white,
      textConfirm: " YES ",
      confirmTextColor: Colors.white,
      onCancel: () {
        Get.toNamed(Routes.cartScreen);
      },
      onConfirm: () {
        productsMap.clear();
        Get.back();
      },
      buttonColor: Get.isDarkMode ? pinkClr : mainColor,
    );
  }

  get productSubTotal =>
      productsMap.entries.map((e) => e.key.price * e.value).toList();

  get total => productsMap.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);

  int quantity() {
    if (productsMap.isEmpty) {
      return 0;
    } else {
      return productsMap.entries
          .map((e) => e.value)
          .toList()
          .reduce((value, element) => value + element);
    }
  }
}
