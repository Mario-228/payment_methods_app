abstract class CheckoutStates {}

class CheckoutInitialState extends CheckoutStates {}

class CheckoutLoadingState extends CheckoutStates {}

class CheckoutSuccessState extends CheckoutStates {}

class CheckoutErrorState extends CheckoutStates {
  final String errorMessage;

  CheckoutErrorState({required this.errorMessage});
}
