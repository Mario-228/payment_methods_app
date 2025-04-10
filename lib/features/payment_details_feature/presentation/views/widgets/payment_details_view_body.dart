import 'package:flutter/material.dart';
import 'package:payment_methods/core/util/functions/navigate_to.dart';
import 'package:payment_methods/features/my_cart_feature/presentation/views/widgets/custom_button.dart';
// import 'package:payment_methods/features/payment_details_feature/presentation/views/widgets/custom_credit_card.dart';
import 'package:payment_methods/features/payment_details_feature/presentation/views/widgets/custom_payment_options.dart';
import 'package:payment_methods/features/thank_you_feature/presentation/views/thank_you_view.dart';

class PaymentDetailsViewBody extends StatefulWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  State<PaymentDetailsViewBody> createState() => _PaymentDetailsViewBodyState();
}

class _PaymentDetailsViewBodyState extends State<PaymentDetailsViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 12.0),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(
            child: CustomPaymentOptions(),
          ),
          // SliverToBoxAdapter(
          //   child: CustomCreditCard(formKey: formKey),
          // ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CustomButton(
                  title: "Pay",
                  onPressed: () {
                    if (formKey.currentState!.validate()) {}
                    navigateTo(context, const ThankYouView());
                  }),
            ),
          )
        ],
      ),
    );
  }
}
