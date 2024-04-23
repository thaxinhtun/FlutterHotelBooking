import 'package:flutter/material.dart';

class CustomReportWidget extends StatelessWidget {
  final Color? color;
  final IconData icon;
  final String title;
  final String totalAmount;
  const CustomReportWidget(
      {super.key,
      this.color,
      required this.icon,
      required this.title,
      required this.totalAmount});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 180,
        height: 120,
        color: color,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(icon),
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text(totalAmount), Text(title)],
              ),
            ),
          ],
        ));
  }
}
