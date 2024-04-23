import 'package:flutter/material.dart';
import 'package:hotel_akimomi/util/constant.dart';
import 'package:hotel_akimomi/util/widget/custom_text.dart';

class HomeSearchCardRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const HomeSearchCardRow(
      {super.key, required this.icon, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.grey,
          ),
          const SizedBox(
            width: 15,
          ),
          CustomText(text: text, textStyle: kTextStyleCustom(15, Colors.black))
        ],
      ),
    );
  }
}
