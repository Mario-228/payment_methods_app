import 'package:flutter/material.dart';
import 'package:paypal_payment_method_app/features/thank_you_feature/presentation/views/widgets/custom_circle_check.dart';
import 'package:paypal_payment_method_app/features/thank_you_feature/presentation/views/widgets/custom_painter_widget.dart';
import 'package:paypal_payment_method_app/features/thank_you_feature/presentation/views/widgets/custom_thank_you_container.dart';
import 'package:paypal_payment_method_app/features/thank_you_feature/presentation/views/widgets/pop_thank_you_circle.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.sizeOf(context).width * 0.05),
      child: const Stack(
        clipBehavior: Clip.none,
        children: [
          CustomThankYouContainer(),
          CustomPainterWidget(),
          PopThankYouCircle(left: -20.0),
          PopThankYouCircle(right: -20.0),
          CustomCircleCheck(size: 50.0),
        ],
      ),
    );
  }
}
