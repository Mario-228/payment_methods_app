import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:payment_methods/core/errors/errors.dart';
import 'package:payment_methods/core/util/models/payment_intent_input_model/payment_intent_input_model.dart';
import 'package:payment_methods/core/util/stripe_service/stripe_service.dart';
import 'package:payment_methods/features/my_cart_feature/data/repos/checkout_repo.dart';

class CheckoutRepoImplementations extends CheckoutRepo {
  @override
  Future<Either<Errors, void>> makePayment(
      {required PaymentIntentInputModel model}) async {
    try {
      var result = await StripeService().makePayment(model: model);
      return right(result);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerError.fromDioError(e));
      }
      return left(ServerError(errorMessage: e.toString()));
    }
  }
}
