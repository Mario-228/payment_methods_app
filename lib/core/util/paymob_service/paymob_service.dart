import 'package:flutter/material.dart';
import 'package:flutter_paymob/flutter_paymob.dart';
import 'package:payment_methods/core/util/functions/show_snack_bar';
import 'package:payment_methods/core/util/paymob_service/paymob_keys.dart';

abstract class PaymobService {
  static Future<bool> initPaymob() async {
    try {
      return await FlutterPaymob.instance.initialize(
        apiKey: PaymobKeys.apiKey,
        integrationID: 5033609,
        walletIntegrationId: 5033610,
        iFrameID: 911096,
      );
    } on Exception catch (e) {
      print("Error from Paymob => : $e");
      return false;
    }
  }

  static Future<void> payWithCard(BuildContext context) async {
    var outerResponse = await FlutterPaymob.instance.payWithCard(
      context: context,
      currency: "EGP",
      amount: 100,
      onPayment: (response) {
        //the successful payment is reversed ... if not true mean success otherwise failed
        if (!response.success == true) {
          showSnackBar(context, response.message ?? "payment success");
        } else {
          showSnackBar(context, response.message ?? "payment failed");
        }
      },
    );
    print("response from Paymob => ${outerResponse.message}");
    print("response from Paymob => ${outerResponse.success}");
  }
}
