import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBtnGradient extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final VoidCallback onTap;
  final Color? top;
  final Color? bottom;
  const CustomBtnGradient(
      {Key? key,
      required this.child,
      required this.width,
      required this.height,
      required this.onTap,
      this.top,
      this.bottom})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  top ?? context.theme.colorScheme.primaryContainer,
                  bottom ?? context.theme.colorScheme.onPrimaryContainer
                ]),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(child: child)),
    );
  }
}
