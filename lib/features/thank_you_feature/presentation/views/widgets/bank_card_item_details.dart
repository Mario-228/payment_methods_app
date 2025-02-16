import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:payment_methods/core/util/app_images/app_images.dart';
import 'package:payment_methods/core/util/styles/styles.dart';

class BankCardItemDetails extends StatelessWidget {
  const BankCardItemDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 22.0),
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Colors.white),
      child: Row(
        children: [
          SvgPicture.asset(AppImages.imagesMasterCard),
          const SizedBox(width: 20.0),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Credit Card", style: Styles.textStyle18),
              Text("Mastercard **78", style: Styles.textStyleBold18),
            ],
          )
        ],
      ),
    );
  }
}
