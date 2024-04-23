import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  final int count;
  final String text;
  const CustomCircleAvatar(
      {super.key, required this.count, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.indigo,
          child: Center(
            child: Text(
              count.toString(),
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(text)                                                                                                                            
      ],
    );
  }
}
