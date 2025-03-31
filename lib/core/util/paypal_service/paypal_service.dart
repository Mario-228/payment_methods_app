import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:payment_methods/core/util/paypal_service/paypal_keys.dart';

abstract class PaypalService {
  static void checkout(BuildContext context) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => PaypalCheckoutView(
            sandboxMode: true,
            clientId: PaypalKeys.clientId,
            secretKey: PaypalKeys.secretKey,
            transactions: const [
              {
                "amount": {
                  "total": '70',
                  "currency": "USD",
                  "details": {
                    "subtotal": '70',
                    "shipping": '0',
                    "shipping_discount": 0
                  }
                },
                "item_list": {
                  "items": [
                    {
                      "name": "Apple",
                      "quantity": 4,
                      "price": '5',
                      "currency": "USD"
                    },
                    {
                      "name": "Pineapple",
                      "quantity": 5,
                      "price": '10',
                      "currency": "USD"
                    }
                  ],
                }
              }
            ],
            note: "Contact us for any questions on your order.",
            onSuccess: (Map params) async {
              print("onSuccess: $params");
            },
            onError: (error) {
              print("onError: $error");
              Navigator.pop(context);
            },
            onCancel: () {
              print('cancelled:');
            },
          ),
        ),
      );
}
