import 'package:flutter/material.dart';

class SittingGuitar extends StatelessWidget {
  const SittingGuitar({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 133,
      left: width - 105,
      height: 140,
      width: 100,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/guitar/guitar@3x.png"),
            fit: BoxFit.contain,
            alignment: Alignment.topCenter,
          ),
        ),
      ),
    );
  }
}
