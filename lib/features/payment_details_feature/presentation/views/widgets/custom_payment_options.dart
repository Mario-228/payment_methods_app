import 'package:flutter/material.dart';
import 'package:payment_methods/core/util/app_images/app_images.dart';
import 'package:payment_methods/features/payment_details_feature/presentation/views/widgets/custom_card_container.dart';

class CustomPaymentOptions extends StatefulWidget {
  const CustomPaymentOptions({
    super.key,
  });

  static const List<String> paymentOptions = [
    AppImages.imagesBankCard,
    AppImages.imagesPaypal,
    AppImages.imagesApplePay,
  ];
  static int selectedIndex = 0;
  @override
  State<CustomPaymentOptions> createState() => _CustomPaymentOptionsState();
}

class _CustomPaymentOptionsState extends State<CustomPaymentOptions> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:
          List.generate(CustomPaymentOptions.paymentOptions.length, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              CustomPaymentOptions.selectedIndex = index;
            });
          },
          child: CustomCardContainer(
            isSelected: CustomPaymentOptions.selectedIndex == index,
            image: CustomPaymentOptions.paymentOptions[index],
          ),
        );
      }),
    );
  }
}
