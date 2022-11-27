import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app_waleed/logic/controller/auth_controller.dart';
import 'package:my_app_waleed/utils/my_string.dart';
import 'package:my_app_waleed/utils/theme.dart';
import 'package:my_app_waleed/view/Widgets/auth/auth_text_from_field.dart';
import 'package:my_app_waleed/view/Widgets/text_utils.dart';

import '../../../routes/routes.dart';
import '../../Widgets/auth/check_widget.dart';
import 'auth_button.dart';
import 'container_under.dart';

class SignUpScreen extends StatelessWidget {
  final formKye = GlobalKey<FormState>();
  SignUpScreen({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? Colors.white : darkGreyclr,
          elevation: 0,
        ),
        backgroundColor: Get.isDarkMode ? Colors.white : darkGreyclr,
        body: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 1.3,
              child: Padding(
                padding: EdgeInsets.only(left: 25, right: 25, top: 40),
                child: Form(
                  key: formKye,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          TextUtils(
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              text: "SIGN",
                              color: Get.isDarkMode ? mainColor : pinkClr,
                              underline: TextDecoration.none),
                          const SizedBox(
                            width: 3,
                          ),
                          TextUtils(
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              text: "UP",
                              color:
                                  Get.isDarkMode ? Colors.black : Colors.white,
                              underline: TextDecoration.none),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      AuthTextFromField(
                        controller: nameController,
                        obscureText: false,
                        validator: (value) {
                          if (value.toString().length <= 2 ||
                              RegExp(validationName).hasMatch(value)) {
                            return 'Enter valid Name';
                          } else {
                            return null;
                          }
                        },
                        prefixIcon: Get.isDarkMode
                            ? Image.asset(
                                '/Users/dylan./my_app_waleed/my_app_waleed/assets/images/user.png')
                            : Icon(
                                Icons.person,
                                color: pinkClr,
                                size: 30,
                              ),
                        suffixIcon: const Text(''),
                        hintText: 'User Name',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AuthTextFromField(
                        controller: emailController,
                        obscureText: false,
                        validator: (value) {
                          if (!RegExp(validationEmail).hasMatch(value)) {
                            return 'Invald Email';
                          } else
                            return null;
                        },
                        prefixIcon: Get.isDarkMode
                            ? Image.asset(
                                '/Users/dylan./my_app_waleed/my_app_waleed/assets/images/email.png')
                            : Icon(
                                Icons.email,
                                color: pinkClr,
                                size: 30,
                              ),
                        suffixIcon: const Text(''),
                        hintText: 'Email',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GetBuilder<AuthController>(builder: (_) {
                        return AuthTextFromField(
                          controller: passwordController,
                          obscureText: controller.isVisibilty ? false : true,
                          validator: (value) {
                            if (value.toString().length < 6) {
                              return 'Password should be longer or equal to 6 characters';
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: Get.isDarkMode
                              ? Image.asset(
                                  '/Users/dylan./my_app_waleed/my_app_waleed/assets/images/lock.png')
                              : const Icon(
                                  Icons.lock,
                                  color: pinkClr,
                                  size: 30,
                                ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              controller.visibilty();
                            },
                            icon: controller.isVisibilty
                                ? const Icon(
                                    Icons.visibility,
                                    color: Colors.black,
                                  )
                                : const Icon(
                                    Icons.visibility_off,
                                    color: Colors.black,
                                  ),
                          ),
                          hintText: 'Password',
                        );
                      }),
                      const SizedBox(
                        height: 50,
                      ),
                      CheckWidget(),
                      const SizedBox(
                        height: 50,
                      ),
                      GetBuilder<AuthController>(builder: (_) {
                        return authButton(
                          onPressed: () {
                            if (controller.isCheckBox == false) {
                              Get.snackbar(
                                "Check Box",
                                "Please, Accept terms & conditions",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.green,
                                colorText: Colors.white,
                              );
                            } else if (formKye.currentState!.validate()) {
                              String name = nameController.text.trim();
                              String email = emailController.text.trim();
                              String password = passwordController.text;
                              controller.signUpUsingFirebase(
                                name: name,
                                email: email,
                                password: password,
                              );
                              controller.isCheckBox = true;
                            }
                          },
                          text: 'SIGN UP',
                        );
                      })
                    ],
                  ),
                ),
              ),
            ),
            ContainerUnder(
              onPressed: () {
                Get.offNamed(Routes.loginScreen);
              },
              text: 'Already have an Account ',
              textType: 'Log in',
            ),
          ],
        )),
      ),
    );
  }
}
