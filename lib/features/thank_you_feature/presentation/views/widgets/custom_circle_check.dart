import 'package:flutter/material.dart';

class CustomCircleCheck extends StatelessWidget {
  const CustomCircleCheck({super.key, required this.size});
  final double size;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0.0,
      right: 0.0,
      top: -size,
      child: CircleAvatar(
        radius: size,
        backgroundColor: const Color(0xffEDEDED),
        child: CircleAvatar(
          radius: size * 0.85,
          backgroundColor: Colors.green,
          child: Icon(
            Icons.check,
            color: Colors.white,
            size: size,
          ),
        ),
      ),
    );
  }
}
