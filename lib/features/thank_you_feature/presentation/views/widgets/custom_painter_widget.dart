import 'package:flutter/material.dart';

class CustomPainterWidget extends StatelessWidget {
  const CustomPainterWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0.0,
      right: 0.0,
      bottom: MediaQuery.sizeOf(context).height * 0.2 + 20.0,
      child: Row(
        children: List.generate(
          30,
          (index) => Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child: Container(
                color: Colors.black,
                width: 2,
                height: 2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
