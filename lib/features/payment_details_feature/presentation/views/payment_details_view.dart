import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paypal_payment_method_app/core/util/app_images/app_images.dart';
import 'package:paypal_payment_method_app/core/util/styles/styles.dart';
import 'package:paypal_payment_method_app/features/payment_details_feature/presentation/views/widgets/payment_details_view_body.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Center(child: SvgPicture.asset(AppImages.imagesArrow))),
        title: const Text(
          'Payment Details',
          style: Styles.textStyle25,
        ),
        centerTitle: true,
      ),
      body: const PaymentDetailsViewBody(),
    );
  }
}
