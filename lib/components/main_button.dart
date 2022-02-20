import 'package:flutter/material.dart';

import '../common/constants/colors.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.color = primaryColor,
    this.gradientColor,
    this.textColor = Colors.white,
    this.prefixIcon,
    this.postfixIcon,
  }) : super(key: key);

  final String text;
  final Color color;
  final Gradient? gradientColor;
  final Color textColor;
  final Icon? prefixIcon;
  final Icon? postfixIcon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(top: 12),
        decoration: BoxDecoration(
          color: color,
          gradient: gradientColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            prefixIcon ?? const SizedBox(),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  color: textColor,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            postfixIcon ?? const SizedBox(),
          ],
        ),
      ),
    );
  }
}
