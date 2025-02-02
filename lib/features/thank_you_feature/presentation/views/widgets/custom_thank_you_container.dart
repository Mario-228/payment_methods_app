import 'package:flutter/material.dart';
import 'package:paypal_payment_method_app/core/util/styles/styles.dart';
import 'package:paypal_payment_method_app/features/my_cart_feature/presentation/views/widgets/total_item_price.dart';
import 'package:paypal_payment_method_app/features/thank_you_feature/presentation/views/widgets/bank_card_item_details.dart';
import 'package:paypal_payment_method_app/features/thank_you_feature/presentation/views/widgets/payment_item_info.dart';
import 'package:paypal_payment_method_app/features/thank_you_feature/presentation/views/widgets/qr_paid_widget.dart';

class CustomThankYouContainer extends StatelessWidget {
  const CustomThankYouContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var qrHeight = ((MediaQuery.sizeOf(context).height * 0.2 + 20.0) / 2) - 55;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xffEDEDED),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 50 + 16, left: 22.0, right: 22.0),
        child: Column(
          children: [
            const Text("Thank You!", style: Styles.textStyle25),
            const Text("Your Transaction was Successful",
                style: Styles.textStyle20),
            const SizedBox(height: 42.0),
            const PaymentItemInfo(title: "Date", value: "12/12/2022"),
            const SizedBox(height: 20.0),
            const PaymentItemInfo(title: "Time", value: "12:00 AM"),
            const SizedBox(height: 20.0),
            const PaymentItemInfo(title: "To", value: "John Doe"),
            const Divider(height: 60.0, color: Colors.black),
            const TotalItemPrice(),
            const SizedBox(height: 30.0),
            const BankCardItemDetails(),
            const Spacer(),
            const QRPaidWidget(),
            SizedBox(height: qrHeight),
          ],
        ),
      ),
    );
  }
}
