import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_akimomi/util/widget/custom_loading.dart';

import '../style.dart';

class CustomLoadingButton extends StatelessWidget {
  final Color? color;
  const CustomLoadingButton({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                color ?? context.theme.primaryColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0)))),
        onPressed: null,
        child: const CustomLoading(
          size: 25,
          color: whiteColor,
        ));
  }
}
