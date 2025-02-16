import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payment_methods/core/util/styles/styles.dart';

class QRPaidWidget extends StatelessWidget {
  const QRPaidWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(FontAwesomeIcons.barcode, size: 105),
        Container(
          alignment: AlignmentDirectional.center,
          width: 110,
          height: 60,
          decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
                side: const BorderSide(width: 1.5, color: Colors.green),
              ),
              color: Colors.white),
          child: Text(
            "PAID",
            style: Styles.textStyle24.copyWith(color: Colors.green),
          ),
        ),
      ],
    );
  }
}
