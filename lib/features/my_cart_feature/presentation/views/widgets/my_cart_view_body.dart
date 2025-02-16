import 'package:flutter/material.dart';
import 'package:payment_methods/core/util/app_images/app_images.dart';
import 'package:payment_methods/features/my_cart_feature/presentation/views/widgets/custom_button.dart';
import 'package:payment_methods/features/my_cart_feature/presentation/views/widgets/custom_payment_bottom_sheet.dart';
import 'package:payment_methods/features/my_cart_feature/presentation/views/widgets/order_info_item.dart';
import 'package:payment_methods/features/my_cart_feature/presentation/views/widgets/total_item_price.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          const SizedBox(height: 18.0),
          const Expanded(
            child: Image(
              image: AssetImage(AppImages.imagesBasketImage),
            ),
          ),
          const SizedBox(height: 25.0),
          const OrderInfoItem(title: 'Order Subtotal', value: '\$ 42.97'),
          const SizedBox(height: 3.0),
          const OrderInfoItem(title: 'Discount', value: '\$ 0.00'),
          const SizedBox(height: 3.0),
          const OrderInfoItem(title: 'Shipping', value: '\$ 8.00'),
          const SizedBox(height: 17.0),
          const Divider(
            indent: 15.0,
            endIndent: 15.0,
            color: Color(0xffC7C7C7),
          ),
          const SizedBox(height: 15.0),
          const TotalItemPrice(),
          const SizedBox(height: 16.0),
          CustomButton(
            title: "Complete Payment",
            onPressed: () => showBottomSheet(
              context: context,
              backgroundColor: Colors.cyanAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              builder: (context) => const CustomPaymentBottomSheet(),
            ),
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
