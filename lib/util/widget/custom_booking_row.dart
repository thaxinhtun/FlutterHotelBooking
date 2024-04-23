import 'package:flutter/material.dart';

class CustomRowBooking extends StatelessWidget {
  final String text;
  final String text2;
  final Color textColor;
  final double fontSize;
  const CustomRowBooking(
      {super.key,
      required this.text,
      required this.textColor,
      required this.fontSize,
      required this.text2});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(fontSize: fontSize, color: textColor),
        ),
        Text(
          text2,
          style: TextStyle(fontSize: fontSize, color: textColor),
        )
      ],
    );
  }
}
