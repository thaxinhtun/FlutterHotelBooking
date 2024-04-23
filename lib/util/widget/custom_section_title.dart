import 'package:flutter/material.dart';

class CustomSectionTitle extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final Widget? widget;
  final bool? bottomBorder;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? titleColor;
  final bool? topBorder;
  final bool? noBorder;
  final bool? isAlignRight;
  final IconData? icon;
  const CustomSectionTitle(
      {Key? key,
      required this.onTap,
      required this.title,
      this.widget,
      this.backgroundColor,
      this.iconColor,
      this.titleColor,
      this.topBorder,
      this.noBorder,
      this.bottomBorder,
      this.isAlignRight,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: [
            Icon(icon),
            Text(
              title,
              style: TextStyle(fontSize: 14, color: titleColor),
            ),
            // CustomText(
            //   text: title,
            //   textStyle:
            //       TextStyle(fontSize: 14, color: titleColor ?? blackColor),
            // ),
            // kHorizontalSpace(12),
            SizedBox(
              width: 12,
            ),
            (isAlignRight ?? false) ? const Spacer() : Container(),
            widget ?? Container(),
            (isAlignRight ?? false) ? Container() : const Spacer(),
            (isAlignRight ?? false)
                ? Container()
                : const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 12,
                  )
          ],
        ),
      ),
    );
  }
}
