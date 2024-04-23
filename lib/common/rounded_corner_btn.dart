import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoundedCornerButton extends StatelessWidget {
  const RoundedCornerButton(
      {Key? key,
      required this.onPressed,
      required this.buttonTitle,
      required this.width,
      required this.backgroundColor,
      required this.foregroundColor})
      : super(key: key);
  final VoidCallback onPressed;
  final String buttonTitle;
  final double width;
  final Color backgroundColor;
  final Color foregroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor, // background color
          foregroundColor: foregroundColor, // text color
          shape: StadiumBorder(
              side: BorderSide(color: context.theme.primaryColor, width: 0)),
        ),
        child: Text(buttonTitle),
      ),
    );
  }
}
