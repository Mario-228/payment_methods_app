import 'package:flutter/material.dart';
import 'package:payment_methods/features/my_cart_feature/presentation/views/my_cart_view.dart';

void main() {
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
