import 'package:flutter/material.dart';
import 'package:my_app_waleed/utils/theme.dart';
import 'package:my_app_waleed/view/Widgets/text_utils.dart';

class PaymentMethodWidget extends StatefulWidget {
  const PaymentMethodWidget({super.key});

  @override
  State<PaymentMethodWidget> createState() => _PaymentMethodWidgetState();
}

class _PaymentMethodWidgetState extends State<PaymentMethodWidget> {
  int radioPaymentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          bulidRadioPayment(
            name: "Paypal",
            image:
                '/Users/dylan./my_app_waleed/my_app_waleed/assets/images/paypal.png',
            scale: 0.7,
            value: 1,
            onChange: (int? value) {
              setState(() {
                radioPaymentIndex = value!;
              });
            },
          ),
          const SizedBox(
            height: 15,
          ),
          bulidRadioPayment(
            name: "Google Pay ",
            image:
                '/Users/dylan./my_app_waleed/my_app_waleed/assets/images/google.png',
            scale: 0.8,
            value: 2,
            onChange: (int? value) {
              setState(
                () {
                  radioPaymentIndex = value!;
                },
              );
            },
          ),
          const SizedBox(
            height: 15,
          ),
          bulidRadioPayment(
            name: "Card ",
            image:
                '/Users/dylan./my_app_waleed/my_app_waleed/assets/images/credit.png',
            scale: 0.8,
            value: 3,
            onChange: (int? value) {
              setState(
                () {
                  radioPaymentIndex = value!;
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget bulidRadioPayment({
    required String image,
    required double scale,
    required String name,
    required int value,
    required Function onChange,
  }) {
    return Container(
      height: 50,
      width: double.infinity,
      color: Colors.grey[300],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                image,
                scale: scale,
              ),
              const SizedBox(
                width: 10,
              ),
              TextUtils(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                text: name,
                color: Colors.black,
                underline: TextDecoration.none,
              )
            ],
          ),
          Radio(
            value: value,
            groupValue: radioPaymentIndex,
            fillColor: MaterialStateColor.resolveWith((states) => mainColor),
            onChanged: (int? value) {
              onChange(value);
            },
          )
        ],
      ),
    );
  }
}
