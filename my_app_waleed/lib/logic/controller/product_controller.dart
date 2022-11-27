import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_app_waleed/modle/product_model.dart';
import 'package:my_app_waleed/service/product_service.dart';

class ProductController extends GetxController {
  var productList = <Welcome>[].obs;
  var isLoading = true.obs;
  var favouritesList = <Welcome>[].obs;
  var stoarge = GetStorage();

  var searchList = <Welcome>[].obs;

  TextEditingController searchTextController = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    List? storedShoppings = stoarge.read<List>("isFavouritesList");

    if (storedShoppings != null) {
      favouritesList =
          storedShoppings.map((e) => Welcome.fromJson(e)).toList().obs;
    }
    getProduct();
  }

  void getProduct() async {
    var products = await ProductServices().getProduct();

    try {
      isLoading(true);
      if (products.isNotEmpty) {}

      productList.addAll(products);
    } finally {
      isLoading(false);
    }
  }

  void manageFavourites(int productId) async {
    var existingIndex =
        favouritesList.indexWhere((element) => element.id == productId);
    if (existingIndex >= 0) {
      favouritesList.removeAt(existingIndex);
      await stoarge.remove("isFavouritesList");
    } else {
      favouritesList
          .add(productList.firstWhere((element) => element.id == productId));

      await stoarge.write("isFavouritesList", favouritesList);
    }
  }

  bool isFavourites(int productId) {
    return favouritesList.any((element) => element.id == productId);
  }

  void addSearchToList(String searchName) {
    searchName = searchName.toLowerCase();

    searchList.value = productList.where((search) {
      var searchTitle = search.title.toLowerCase();
      var searchPrice = search.price.toString().toLowerCase();

      return searchTitle.contains(searchName) ||
          searchPrice.toString().contains(searchName);
    }).toList();

    update();
  }

  void clearSearch() {
    searchTextController.clear();
    addSearchToList("");
  }
}
