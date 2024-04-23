import 'package:flutter/material.dart';

class CustomeExploreArea extends StatelessWidget {
  final IconData icon;
  final String location;
  final String minuute;
  final String walkOrDrive;
  const CustomeExploreArea(
      {super.key,
      required this.icon,
      required this.location,
      required this.minuute,
      required this.walkOrDrive});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          icon,
          color: Colors.indigo,
        ),
        Text(location),
        const SizedBox(width: 30),
        Text("$minuute $walkOrDrive")
      ],
    );
  }
}
