import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_methods/core/util/api_services/api_keys.dart';
import 'package:payment_methods/core/util/paymob_service/paymob_service.dart';
import 'package:payment_methods/features/my_cart_feature/presentation/views/my_cart_view.dart';

void main() {
  Stripe.publishableKey = ApiKeys.publishKey;
  PaymobService.initPaymob();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(
        useMaterial3: true,
      ),
      home: const MyCartView(),
    );
  }
}
