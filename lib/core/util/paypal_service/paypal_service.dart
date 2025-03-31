import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:payment_methods/core/util/paypal_service/paypal_keys.dart';

import '../models/paypal_transaction_model/amount.dart';
import '../models/paypal_transaction_model/details.dart';
import '../models/paypal_transaction_model/item.dart';
import '../models/paypal_transaction_model/item_list.dart';
import '../models/paypal_transaction_model/paypal_transaction_model.dart';

abstract class PaypalService {
  static final PaypalTransactionModel transactionModel = PaypalTransactionModel(
    amount: Amount(
      total: '70',
      currency: 'USD',
      details: Details(
        subtotal: '70',
        shipping: '0',
        shippingDiscount: 0,
      ),
    ),
    itemList: ItemList(
      items: [
        Item(
          name: 'Apple',
          quantity: 4,
          price: '5',
          currency: 'USD',
        ),
        Item(
          name: 'Pineapple',
          quantity: 5,
          price: '10',
          currency: 'USD',
        ),
      ],
    ),
  );
  static void checkout(BuildContext context) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => PaypalCheckoutView(
            sandboxMode: true,
            clientId: PaypalKeys.clientId,
            secretKey: PaypalKeys.secretKey,
            transactions: [
              transactionModel.toJson(),
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
