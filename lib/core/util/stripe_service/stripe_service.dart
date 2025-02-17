import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_methods/core/util/api_services/api_keys.dart';
import 'package:payment_methods/core/util/api_services/api_services.dart';
import 'package:payment_methods/core/util/models/payment_intent_input_model/payment_intent_input_model.dart';
import 'package:payment_methods/core/util/models/payment_intent_model/payment_intent_model.dart';

class StripeService {
  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel model) async {
    var response = await ApiServices().postData(
        parameters: model.toJson(),
        url: ApiKeys.createIntentUrl,
        token: ApiKeys.secretkey);
    return PaymentIntentModel.fromJson(response.data);
  }

  Future<void> initPaymentSheet(
          {required String paymentIntentClientSecret}) async =>
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: paymentIntentClientSecret,
            merchantDisplayName: "Mario Youssef"),
      );

  Future<void> presentPaymentSheet() async =>
      await Stripe.instance.presentPaymentSheet();

  Future<void> makePayment({required PaymentIntentInputModel model}) async {
    var data = await createPaymentIntent(model);
    await initPaymentSheet(paymentIntentClientSecret: data.clientSecret!);
    await presentPaymentSheet();
  }
}
