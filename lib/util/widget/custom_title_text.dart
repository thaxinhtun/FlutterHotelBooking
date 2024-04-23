import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant.dart';
import 'custom_text.dart';

class CustomTitleText extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String description;
  const CustomTitleText(
      {Key? key,
      required this.onTap,
      required this.description,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: title,
          textStyle: kTextStyleCustom(12, context.theme.primaryColorDark),
        ),
        kVerticalSpace(8),
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.only(left: 15, bottom: 8),
            child: CustomText(
              text: description,
              textStyle: kTextStyleBoldCustom(
                  14, context.theme.colorScheme.onPrimaryContainer),
            ),
          ),
        )
      ],
    );
  }
}
