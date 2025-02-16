import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCardContainer extends StatelessWidget {
  const CustomCardContainer(
      {super.key, required this.image, this.isSelected = false});
  final String image;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 103,
        height: 62,
        decoration: decorationCardContainer(),
        child: Center(
          child: SvgPicture.asset(
            image,
          ),
        ),
      ),
    );
  }

  ShapeDecoration decorationCardContainer() {
    return ShapeDecoration(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: BorderSide(
          width: 1.5,
          color: isSelected
              ? const Color(0xFF34A853)
              : const Color(0xFF000000).withOpacity(0.7),
        ),
      ),
      shadows: [
        BoxShadow(
          color: isSelected
              ? const Color(0xFF34A853)
              : const Color(0xFF000000).withOpacity(0.7),
          spreadRadius: 0,
          blurRadius: 4,
          offset: const Offset(0, 0),
        ),
      ],
    );
  }
}
