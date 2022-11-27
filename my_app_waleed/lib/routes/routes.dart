import 'package:get/route_manager.dart';
import 'package:my_app_waleed/logic/bindings/product_binding.dart';
import 'package:my_app_waleed/view/Widgets/auth/payment_screen.dart';
import 'package:my_app_waleed/view/screen/auth/forget_password_screen.dart';
import 'package:my_app_waleed/view/screen/auth/login_screen.dart';
import 'package:my_app_waleed/view/screen/auth/signup_screen.dart';
import 'package:my_app_waleed/view/screen/cart_screen.dart';
import 'package:my_app_waleed/view/screen/main_screen.dart';
import 'package:my_app_waleed/view/screen/welcome_screen.dart';

import '../logic/bindings/auth.binding.dart';
import '../logic/bindings/main_binding.dart';

class AppRoutes {
  static const welcome = Routes.WelcomeScreen;
  static const mainScreen = Routes.MainScreen;

  static final routes = [
    GetPage(
      name: Routes.WelcomeScreen,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.SignUpScreen,
      page: () => SignUpScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.ForgotPasswordScreen,
      page: () => ForgotPasswordScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.MainScreen,
      page: () => MainScreen(),
      bindings: [
        AuthBinding(),
        MainBinding(),
        ProductBinding(),
      ],
    ),
    GetPage(
      name: Routes.cartScreen,
      page: () => CartScreen(),
      bindings: [
        AuthBinding(),
        ProductBinding(),
      ],
    ),
    GetPage(
      name: Routes.paymentScreen,
      page: () => PayMentScreen(),
      bindings: [
        AuthBinding(),
        ProductBinding(),
        MainBinding(),
      ],
    ),
  ];
}

class Routes {
  static const WelcomeScreen = '/welcomeSceen';
  static const loginScreen = '/LoginScreen';
  static const SignUpScreen = '/SignUpScreen';
  static const ForgotPasswordScreen = '/forgotPassowrdScreen';
  static const MainScreen = '/MainScreen';
  static const cartScreen = '/CartScreen';
  static const paymentScreen = '/PayMentScreen';
}
