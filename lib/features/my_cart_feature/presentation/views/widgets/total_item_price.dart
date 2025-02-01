import 'package:flutter/material.dart';
import 'package:paypal_payment_method_app/core/util/styles/styles.dart';

class TotalItemPrice extends StatelessWidget {
  const TotalItemPrice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Total',
          style: Styles.textStyle24,
        ),
        Text(
          '\$ 50.97',
          style: Styles.textStyle24,
        ),
      ],
    );
  }
}
