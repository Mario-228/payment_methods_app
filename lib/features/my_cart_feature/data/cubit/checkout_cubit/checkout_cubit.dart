import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_methods/core/util/models/payment_intent_input_model/payment_intent_input_model.dart';
import 'package:payment_methods/features/my_cart_feature/data/cubit/checkout_cubit/checkout_states.dart';
import 'package:payment_methods/features/my_cart_feature/data/repos/checkout_repo_implementations.dart';

class CheckoutCubit extends Cubit<CheckoutStates> {
  CheckoutCubit() : super(CheckoutInitialState());
  static CheckoutCubit get(BuildContext context) => BlocProvider.of(context);
  Future<void> makePayment(PaymentIntentInputModel model) async {
    emit(CheckoutLoadingState());
    var response =
        await CheckoutRepoImplementations().makePayment(model: model);
    response.fold(
      (error) => emit(CheckoutErrorState(errorMessage: error.errorMessage)),
      (value) => emit(CheckoutSuccessState()),
    );
  }
}
