import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app_waleed/modle/product_model.dart';

import '../Widgets/productDetails/add_cart.dart';
import '../Widgets/productDetails/clothes_info.dart';
import '../Widgets/productDetails/image_slider.dart';
import '../Widgets/productDetails/size_list.dart';

class ProductDeitailScreen extends StatelessWidget {
  final Welcome welcome;
  const ProductDeitailScreen({
    required this.welcome,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(
              //   height: 40,
              // ),
              ImageSliders(
                imageUrl: welcome.image,
              ),
              ClothesInfo(
                title: welcome.title,
                productId: welcome.id,
                rate: welcome.rating.rate,
                description: welcome.description,
              ),
              const SizeList(),
              AddCart(
                price: welcome.price,
                welcome: welcome,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
