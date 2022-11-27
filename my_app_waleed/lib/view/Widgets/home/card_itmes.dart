import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app_waleed/logic/controller/cart_controller.dart';
import 'package:my_app_waleed/logic/controller/product_controller.dart';
import 'package:my_app_waleed/modle/product_model.dart';
import 'package:my_app_waleed/utils/theme.dart';
import 'package:my_app_waleed/view/Widgets/text_utils.dart';
import 'package:my_app_waleed/view/screen/product_details_screen.dart';

class CardItems extends StatelessWidget {
  CardItems({Key? key}) : super(key: key);

  final controller = Get.find<ProductController>();

  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(
            color: Get.isDarkMode ? pinkClr : mainColor,
          ),
        );
      } else {
        return Expanded(
          child: controller.searchList.isEmpty &&
                  controller.searchTextController.text.isNotEmpty
              ? Get.isDarkMode
                  ? Image.asset(
                      "/Users/dylan./my_app_waleed/my_app_waleed/assets/images/search_empty_dark.png")
                  : Image.asset(
                      "/Users/dylan./my_app_waleed/my_app_waleed/assets/images/search_empry_light.png")
              : GridView.builder(
                  itemCount: controller.searchList.isEmpty
                      ? controller.productList.length
                      : controller.searchList.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    childAspectRatio: 0.8,
                    mainAxisSpacing: 9.0,
                    crossAxisSpacing: 6.0,
                    maxCrossAxisExtent: 300,
                  ),
                  itemBuilder: ((context, index) {
                    if (controller.searchList.isEmpty) {
                      return buildCardItems(
                        image: controller.productList[index].image,
                        price: controller.productList[index].price,
                        rate: controller.productList[index].rating.rate,
                        productId: controller.productList[index].id,
                        welcome: controller.productList[index],
                        onTap: (() {
                          Get.to(
                            () => ProductDeitailScreen(
                              welcome: controller.productList[index],
                            ),
                          );
                        }),
                      );
                    } else {
                      return buildCardItems(
                        image: controller.searchList[index].image,
                        price: controller.searchList[index].price,
                        rate: controller.searchList[index].rating.rate,
                        productId: controller.searchList[index].id,
                        welcome: controller.searchList[index],
                        onTap: (() {
                          Get.to(
                            () => ProductDeitailScreen(
                              welcome: controller.searchList[index],
                            ),
                          );
                        }),
                      );
                    }
                  }),
                ),
        );
      }
    });
  }

  Widget buildCardItems({
    required String image,
    required double price,
    required double rate,
    required int productId,
    required Welcome welcome,
    required Function() onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0,
                blurRadius: 5.0,
              ),
            ],
          ),
          child: Column(
            children: [
              Obx(
                (() => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            controller.manageFavourites(productId);
                          },
                          icon: controller.isFavourites(productId)
                              ? Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )
                              : Icon(
                                  Icons.favorite_outline,
                                  color: Colors.black,
                                ),
                        ),
                        IconButton(
                          onPressed: () {
                            cartController.addProductToCart(welcome);
                          },
                          icon: const Icon(
                            Icons.shopping_cart,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    )),
              ),
              Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(
                  image,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$ $price",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 45,
                      decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 2, right: 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextUtils(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              text: "$rate",
                              color: Colors.white,
                              underline: TextDecoration.none,
                            ),
                            const Icon(
                              Icons.star,
                              size: 13,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
