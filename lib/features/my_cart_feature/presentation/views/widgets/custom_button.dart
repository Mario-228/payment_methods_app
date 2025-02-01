import 'package:flutter/material.dart';
import 'package:paypal_payment_method_app/core/util/styles/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.title, this.onPressed});
  final String title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      height: 73.0,
      minWidth: double.infinity,
      color: const Color(0xff34A853),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Text(
        title,
        style: Styles.textStyle22,
      ),
    );
  }
}
