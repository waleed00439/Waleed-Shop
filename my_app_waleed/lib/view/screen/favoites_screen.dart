import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app_waleed/logic/controller/product_controller.dart';

class FavoitesScreen extends StatelessWidget {
  FavoitesScreen({Key? key}) : super(key: key);

  final controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Obx(() {
        if (controller.favouritesList.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset(
                      "/Users/dylan./my_app_waleed/my_app_waleed/assets/images/heart.png"),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Please, Add your favorites products.",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 18),
                ),
              ],
            ),
          );
        } else {
          return ListView.separated(
            itemBuilder: (context, index) {
              return bulidFavItmes(
                image: controller.favouritesList[index].image,
                price: controller.favouritesList[index].price,
                title: controller.favouritesList[index].title,
                productid: controller.favouritesList[index].id,
              );
            },
            separatorBuilder: (context, index) {
              return const Divider(
                color: Colors.grey,
                thickness: 1,
              );
            },
            itemCount: controller.favouritesList.length,
          );
        }
      }),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       SizedBox(
      //         height: 100,
      //         width: 100,
      //         child: Image.asset(
      //             "/Users/dylan./my_app_waleed/my_app_waleed/assets/images/heart.png"),
      //       ),
      //       SizedBox(
      //         height: 20,
      //       ),
      //       Text(
      //         "Please, Add your favorites products.",
      //         style: TextStyle(
      //             fontWeight: FontWeight.bold,
      //             color: Get.isDarkMode ? Colors.white : Colors.black,
      //             fontSize: 18),
      //       ),
      //     ],
      //   ),
      // ),

      // body: ListView.separated(
      //   itemBuilder: (context, index) {
      //     return bulidFavItmes();
      //   },
      //   separatorBuilder: (context, index) {
      //     return Divider(
      //       color: Colors.grey,
      //       thickness: 1,
      //     );
      //   },
      //   itemCount: 10,
      // ),
    );
  }

  Widget bulidFavItmes({
    required String image,
    required double price,
    required String title,
    required int productid,
  }) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: Row(
          children: [
            SizedBox(
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              flex: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '\$ $price',
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                controller.manageFavourites(productid);
              },
              icon: const Icon(
                Icons.favorite,
                color: Colors.red,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
