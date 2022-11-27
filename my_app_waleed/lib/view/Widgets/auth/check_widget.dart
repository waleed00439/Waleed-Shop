import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app_waleed/logic/controller/auth_controller.dart';
import 'package:my_app_waleed/utils/theme.dart';
import 'package:my_app_waleed/view/Widgets/text_utils.dart';

class CheckWidget extends StatelessWidget {
  CheckWidget({Key? key}) : super(key: key);

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_) {
      return Row(
        children: [
          InkWell(
            onTap: () {
              controller.checkBox();
            },
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: controller.isCheckBox
                  ? Get.isDarkMode
                      ? Image.asset(
                          '/Users/dylan./my_app_waleed/my_app_waleed/assets/images/check.png')
                      : Icon(
                          Icons.done,
                          color: pinkClr,
                        )
                  : Container(),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Row(
            children: [
              TextUtils(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                text: 'I accept ',
                color: Get.isDarkMode ? Colors.black : Colors.white,
                underline: TextDecoration.none,
              ),
              TextUtils(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                text: 'terms & conditions',
                color: Get.isDarkMode ? Colors.black : Colors.white,
                underline: TextDecoration.underline,
              ),
            ],
          )
        ],
      );
    });
  }
}
