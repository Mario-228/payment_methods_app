import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:payment_methods/core/util/app_images/app_images.dart';
import 'package:payment_methods/core/util/styles/styles.dart';
import 'package:payment_methods/features/my_cart_feature/presentation/views/widgets/my_cart_view_body.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Center(child: SvgPicture.asset(AppImages.imagesArrow)),
        title: const Text(
          'My Cart',
          style: Styles.textStyle25,
        ),
        centerTitle: true,
      ),
      body: const MyCartViewBody(),
    );
  }
}
