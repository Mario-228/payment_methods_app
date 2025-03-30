import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_methods/core/util/functions/navigate_to.dart';
import 'package:payment_methods/core/util/functions/show_snack_bar';
import 'package:payment_methods/core/util/models/payment_intent_input_model/payment_intent_input_model.dart';
import 'package:payment_methods/features/my_cart_feature/presentation/views_models/cubit/checkout_cubit/checkout_cubit.dart';
import 'package:payment_methods/features/my_cart_feature/presentation/views_models/cubit/checkout_cubit/checkout_states.dart';
import 'package:payment_methods/features/my_cart_feature/presentation/views/widgets/custom_button.dart';
import 'package:payment_methods/features/thank_you_feature/presentation/views/thank_you_view.dart';

class CustomPayButtonBlocConsumer extends StatelessWidget {
  const CustomPayButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckoutCubit(),
      child: BlocConsumer<CheckoutCubit, CheckoutStates>(
        listener: (context, state) {
          if (state is CheckoutSuccessState) {
            navigateTo(context, ThankYouView());
          } else if (state is CheckoutErrorState) {
            showSnackBar(context, state.errorMessage);
          }
        },
        builder: (context, state) {
          if (state is CheckoutLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return CustomButton(
              title: "Pay",
              onPressed: () => CheckoutCubit.get(context).makePayment(
                  PaymentIntentInputModel(amount: "10000", currency: "usd")),
            );
          }
        },
      ),
    );
  }
}
