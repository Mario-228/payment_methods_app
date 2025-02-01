import 'package:flutter/material.dart';
import 'package:paypal_payment_method_app/core/util/styles/styles.dart';

class OrderInfoItem extends StatelessWidget {
  const OrderInfoItem({super.key, required this.title, required this.value});
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Styles.textStyle18,
        ),
        Text(
          value,
          style: Styles.textStyle18,
        ),
      ],
    );
  }
}
