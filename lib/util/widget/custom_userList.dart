import 'package:flutter/material.dart';
import 'package:hotel_akimomi/util/constant.dart';

class CustomUserList extends StatelessWidget {
  final IconData icon;
  final String name;
  final String email;
  final String loginDate;
  final String img;

  const CustomUserList(
      {super.key,
      required this.icon,
      required this.name,
      required this.email,
      required this.loginDate,
      required this.img});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        img != ""
            ? CircleAvatar(
                radius: 40,
                child: CircleAvatar(
                  radius: 38,
                  child: Image.network(
                    img,
                  ),
                ),
              )
            : Container(),
        const SizedBox(
          width: 15,
        ),
        Text(name),
        const SizedBox(
          width: 30,
        ),
        Text(email),
        const SizedBox(
          width: 30,
        ),
        Text(dayMonthNameYearFormat.format(DateTime.parse(loginDate))),
      ],
    );
  }
}
