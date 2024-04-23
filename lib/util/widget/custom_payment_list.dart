import 'package:flutter/material.dart';

class CustomPaymentList extends StatelessWidget {
  final IconData icon;
  final String name;
  final String payDate;
  final String amount;
  const CustomPaymentList(
      {super.key,
      required this.icon,
      required this.name,
      required this.payDate,
      required this.amount});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CircleAvatar(
          radius: 20,
          child: Icon(icon),
        ),
        const SizedBox(
          width: 15,
        ),
        Text(name),
        const SizedBox(
          width: 30,
        ),
        Text(payDate),
        const SizedBox(
          width: 30,
        ),
        Text(amount),
      ],
    );
  }
}
