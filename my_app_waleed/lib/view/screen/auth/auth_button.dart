import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app_waleed/utils/theme.dart';
import 'package:my_app_waleed/view/Widgets/text_utils.dart';

class authButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const authButton({required this.text, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          primary: Get.isDarkMode ? pinkClr : mainColor,
          maximumSize: const Size(360, 50),
          fixedSize: const Size(400, 70)),
      child: TextUtils(
        color: Colors.white,
        text: text,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        underline: TextDecoration.none,
      ),
    );
  }
}
