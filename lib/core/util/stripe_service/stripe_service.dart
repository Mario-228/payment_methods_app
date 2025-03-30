import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_methods/core/util/api_services/api_keys.dart';
import 'package:payment_methods/core/util/api_services/api_services.dart';
import 'package:payment_methods/core/util/models/init_payment_sheet_input_model/init_payment_sheet_input_model.dart';
import 'package:payment_methods/core/util/models/payment_intent_input_model/payment_intent_input_model.dart';
import 'package:payment_methods/core/util/models/payment_intent_model/payment_intent_model.dart';
import 'package:payment_methods/features/my_cart_feature/data/models/ephemeral_key_model/ephemeral_key_model.dart';

class StripeService {
  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel model) async {
    var response = await ApiServices().postData(
        contentType: Headers.formUrlEncodedContentType,
        parameters: model.toJson(),
        url: ApiKeys.createIntentUrl,
        token: ApiKeys.secretkey);
    return PaymentIntentModel.fromJson(response.data);
  }

  Future<void> initPaymentSheet(
          {required InitPaymentSheetInputModel
              initPaymentSheetInputModel}) async =>
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
            customerEphemeralKeySecret:
                initPaymentSheetInputModel.ephemeralKeySecret,
            customerId: initPaymentSheetInputModel.customerId,
            paymentIntentClientSecret:
                initPaymentSheetInputModel.paymentIntentClientSecret,
            merchantDisplayName: "Mario Youssef"),
      );

  Future<void> presentPaymentSheet() async =>
      await Stripe.instance.presentPaymentSheet();

  Future<void> makePayment({required PaymentIntentInputModel model}) async {
    var data = await createPaymentIntent(model);
    //before creating the ephemeral key we must create the customer id first
    var ephemeralKeyModel = await createEphemeralKey(model.customerId);
    InitPaymentSheetInputModel inputModel = InitPaymentSheetInputModel(
        paymentIntentClientSecret: data.clientSecret!,
        customerId: model
            .customerId, //the customer id must get it from the endPoint in api keys (createCustomerIdUrl) and get the customer id ... must be only one id for one customer
        ephemeralKeySecret: ephemeralKeyModel.secret!);
    await initPaymentSheet(initPaymentSheetInputModel: inputModel);
    await presentPaymentSheet();
  }

  Future<EphemeralKeyModel> createEphemeralKey(String customerId) async {
    var response = await ApiServices().postData(
        headers: {
          "Authorization": "Bearer ${ApiKeys.secretkey}",
          "Stripe-Version": "2025-01-27.acacia",
        },
        contentType: Headers.formUrlEncodedContentType,
        parameters: {"customer": customerId},
        url: ApiKeys.createEphemeralKeyUrl,
        token: ApiKeys.secretkey);
    return EphemeralKeyModel.fromJson(response.data);
  }
}
