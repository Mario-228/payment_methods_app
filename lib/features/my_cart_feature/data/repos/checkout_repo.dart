import 'package:dartz/dartz.dart';
import 'package:payment_methods/core/errors/errors.dart';
import 'package:payment_methods/core/util/models/payment_intent_input_model/payment_intent_input_model.dart';

abstract class CheckoutRepo {
  Future<Either<Errors, void>> makePayment(
      {required PaymentIntentInputModel model});
}
