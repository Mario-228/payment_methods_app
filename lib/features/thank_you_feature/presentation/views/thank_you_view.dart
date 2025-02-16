import 'package:flutter/material.dart';
import 'package:payment_methods/core/util/functions/build_app_bar.dart';
import 'package:payment_methods/features/thank_you_feature/presentation/views/widgets/thank_you_view_body.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Transform.translate(
        offset: const Offset(0, -18),
        child: const ThankYouViewBody(),
      ),
    );
  }
}
