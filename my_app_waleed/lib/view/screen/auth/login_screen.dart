import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controller/auth_controller.dart';
import '../../../routes/routes.dart';
import '../../../utils/my_string.dart';
import '../../../utils/theme.dart';
import '../../Widgets/auth/auth_text_from_field.dart';
import '../../Widgets/text_utils.dart';
import 'auth_button.dart';
import 'container_under.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final formKye = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? darkGreyclr : Colors.white,
          elevation: 0,
        ),
        backgroundColor: Get.isDarkMode ? darkGreyclr : Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 40),
                  child: Form(
                    key: formKye,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            TextUtils(
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                text: "LOG",
                                color: Get.isDarkMode ? pinkClr : mainColor,
                                underline: TextDecoration.none),
                            const SizedBox(
                              width: 3,
                            ),
                            TextUtils(
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                text: "IN",
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Colors.black,
                                underline: TextDecoration.none),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
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
                              ? Icon(
                                  Icons.email,
                                  color: pinkClr,
                                  size: 30,
                                )
                              : Image.asset(
                                  '/Users/dylan./my_app_waleed/my_app_waleed/assets/images/email.png',
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
                                ? Icon(
                                    Icons.lock,
                                    color: Get.isDarkMode ? pinkClr : mainColor,
                                    size: 30,
                                  )
                                : Image.asset(
                                    '/Users/dylan./my_app_waleed/my_app_waleed/assets/images/lock.png'),
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
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Get.toNamed(Routes.ForgotPasswordScreen);
                            },
                            child: TextUtils(
                              text: 'Forgot Password',
                              fontSize: 14,
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                              underline: TextDecoration.none,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        GetBuilder<AuthController>(builder: (_) {
                          return authButton(
                            onPressed: () {
                              if (formKye.currentState!.validate()) {
                                String email = emailController.text.trim();
                                String password = passwordController.text;

                                controller.loginUsingFirebase(
                                    email: email, password: password);
                              }
                            },
                            text: 'LOG IN',
                          );
                        }),
                        const SizedBox(
                          height: 20,
                        ),
                        TextUtils(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            text: " OR",
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                            underline: TextDecoration.none),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GetBuilder<AuthController>(builder: (_) {
                              return InkWell(
                                onTap: () {
                                  controller.googleSignUpApp();
                                },
                                child: Image.asset(
                                  "/Users/dylan./my_app_waleed/my_app_waleed/assets/images/google.png",
                                ),
                              );
                            }),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                controller.faceBookSignUpApp();
                              },
                              child: Image.asset(
                                "/Users/dylan./my_app_waleed/my_app_waleed/assets/images/facebook.png",
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ContainerUnder(
                onPressed: () {
                  Get.offNamed(Routes.SignUpScreen);
                },
                text: "don't have an Account",
                textType: 'Sign up',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
