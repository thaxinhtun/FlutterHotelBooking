import 'package:flutter/material.dart';

class CustomAmenitiesCircle extends StatelessWidget {
  final IconData icon;
  final String text;
  const CustomAmenitiesCircle(
      {super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.indigo,
          child: Center(
              child: Icon(
            icon,
            color: Colors.white,
          )),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(text)
      ],
    );
  }
}
