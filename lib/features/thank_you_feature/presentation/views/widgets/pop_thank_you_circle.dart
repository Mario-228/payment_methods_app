import 'package:flutter/material.dart';

class PopThankYouCircle extends StatelessWidget {
  const PopThankYouCircle({
    super.key,
    this.right,
    this.left,
  });
  final double? right;
  final double? left;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: MediaQuery.sizeOf(context).height * 0.2,
      right: right,
      left: left,
      child: const CircleAvatar(
        backgroundColor: Colors.white,
      ),
    );
  }
}
