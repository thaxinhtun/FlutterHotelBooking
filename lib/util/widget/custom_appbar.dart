import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant.dart';
import 'custom_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? color;
  final Color? textColor;
  final bool? showlogo;
  final Color? backBtnColor;
  const CustomAppBar(
      {Key? key,
      required this.title,
      this.color,
      this.textColor,
      this.showlogo,
      this.backBtnColor})
      : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        backgroundColor: color ?? context.theme.colorScheme.surface,
        elevation: 0,
        centerTitle: true,
        title: CustomText(
          text: title,
          textStyle: kTextStyleCustom(
              16, textColor ?? context.theme.colorScheme.onPrimary),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          (showlogo ?? false)
              ? SizedBox(
                  width: 50,
                  height: 50,
                  child: Image.asset('assets/icon/small_icon.png'))
              : Container(),
        ],
      ),
    );
  }
}
