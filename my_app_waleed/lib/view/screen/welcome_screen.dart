import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app_waleed/utils/theme.dart';
import 'package:my_app_waleed/view/screen/auth/login_screen.dart';
import 'package:my_app_waleed/view/screen/auth/signup_screen.dart';

import '../../routes/routes.dart';
import '../Widgets/text_utils.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                  '/Users/dylan./my_app_waleed/my_app_waleed/assets/images/background.png',
                  fit: BoxFit.cover),
            ),
            Container(
              color: Colors.black.withOpacity(0.2),
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Container(
                    height: 60,
                    width: 190,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: TextUtils(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        text: 'Welcome',
                        color: Colors.white,
                        underline: TextDecoration.none,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      height: 60,
                      width: 230,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextUtils(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            text: "Waleed",
                            color: Get.isDarkMode ? pinkClr : mainColor,
                            underline: TextDecoration.none,
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          TextUtils(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            text: "Shoop",
                            color: Colors.white,
                            underline: TextDecoration.none,
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 250,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Get.isDarkMode ? pinkClr : mainColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 12,
                        )),
                    onPressed: () {
                      Get.offNamed(Routes.loginScreen);
                    },
                    // ignore: prefer_const_constructors
                    child: TextUtils(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      text: 'Get Start',
                      color: Colors.white,
                      underline: TextDecoration.none,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextUtils(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          text: "don't have an accont? ",
                          underline: TextDecoration.none,
                          color: Colors.white),
                      TextButton(
                        onPressed: () {
                          Get.offNamed(Routes.SignUpScreen);
                        },
                        child: TextUtils(
                          text: 'Sign Up',
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          underline: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
