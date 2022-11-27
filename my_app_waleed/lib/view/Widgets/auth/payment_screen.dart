import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app_waleed/view/Widgets/text_utils.dart';

import '../../../utils/theme.dart';
import '../payment/delivery_continer_widget.dart';
import '../payment/payment_method_widget.dart';

class PayMentScreen extends StatelessWidget {
  const PayMentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        title: const Text("PayMent"),
        elevation: 0,
        backgroundColor: Get.isDarkMode ? darkGreyclr : mainColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextUtils(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              text: "Shopping to",
              color: Get.isDarkMode ? Colors.white : Colors.black,
              underline: TextDecoration.none,
            ),
            const SizedBox(
              height: 20,
            ),
            DeliveryContinerWidget(),
            const SizedBox(
              height: 20,
            ),
            TextUtils(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              text: "Payment method",
              color: Get.isDarkMode ? Colors.white : Colors.black,
              underline: TextDecoration.none,
            ),
            const SizedBox(
              height: 20,
            ),
            PaymentMethodWidget(),
            SizedBox(
              height: 20,
            ),
            Center(
              child: TextUtils(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                text: "Total: 200\$",
                color: Get.isDarkMode ? Colors.white : Colors.black,
                underline: TextDecoration.none,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: SizedBox(
                height: 50,
                width: 150,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                      primary: Get.isDarkMode ? pinkClr : mainColor),
                  onPressed: () {},
                  child: Text(
                    "Pay Now",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
