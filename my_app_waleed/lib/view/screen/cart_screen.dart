import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app_waleed/logic/controller/cart_controller.dart';
import 'package:my_app_waleed/utils/theme.dart';

import '../Widgets/cart/cart_product_card.dart';
import '../Widgets/cart/cart_total.dart';
import '../Widgets/cart/empty_cart.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(
            title: const Text("Cart Items"),
            elevation: 0,
            backgroundColor: Get.isDarkMode ? darkGreyclr : mainColor,
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  controller.clearAllProducts();
                },
                icon: const Icon(Icons.backspace),
              ),
            ],
          ),
          body: Obx(
            () {
              if (controller.productsMap.isEmpty) {
                return EmptyCart();
              } else {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 600,
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            return CartProductCard(
                              welcome:
                                  controller.productsMap.keys.toList()[index],
                              index: index,
                              quantity:
                                  controller.productsMap.values.toList()[index],
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 20,
                          ),
                          itemCount: controller.productsMap.length,
                        ),
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 30),
                        child: CartTotal(),
                      ),
                    ],
                  ),
                );
              }
            },
          )),
    );
  }
}
