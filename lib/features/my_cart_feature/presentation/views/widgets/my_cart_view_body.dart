import 'package:flutter/material.dart';
import 'package:paypal_payment_method_app/core/util/app_images/app_images.dart';
import 'package:paypal_payment_method_app/core/util/functions/navigate_to.dart';
import 'package:paypal_payment_method_app/features/my_cart_feature/presentation/views/widgets/custom_button.dart';
import 'package:paypal_payment_method_app/features/my_cart_feature/presentation/views/widgets/order_info_item.dart';
import 'package:paypal_payment_method_app/features/my_cart_feature/presentation/views/widgets/total_item_price.dart';
import 'package:paypal_payment_method_app/features/payment_details_feature/presentation/views/payment_details_view.dart';

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
            onPressed: () {
              navigateTo(context, const PaymentDetailsView());
            },
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
