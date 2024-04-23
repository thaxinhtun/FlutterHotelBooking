import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../constant.dart';

import '../style.dart';

import 'custom_btn_gradient.dart';
import 'custom_text.dart';

showAlertDialog(BuildContext context, String title, String message,
    String btnText, VoidCallback onTap) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        elevation: 0,
        contentPadding: const EdgeInsets.all(15),
        backgroundColor: Colors.transparent,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.cancel,
                  color: greyColor,
                ),
              ),
            ),
            kVerticalSpace(8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: context.theme.scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                    text: title,
                    textStyle: kTextStyleError(16),
                    isAlignCenter: true,
                  ),
                  kVerticalSpace(15),
                  CustomText(
                    text: message,
                    textStyle:
                        kTextStyleCustom(14, context.theme.colorScheme.primary),
                    isAlignCenter: true,
                  ),
                  kVerticalSpace(15),
                  CustomBtnGradient(
                      child: CustomText(
                          text: btnText, textStyle: kTextStyleWhite(14)),
                      width: 150.w,
                      height: 40.h,
                      onTap: onTap),
                  kVerticalSpace(10),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}

// showNoInternetDialog(BuildContext context, String message, VoidCallback onExit,
//     VoidCallback onRetry) {
//   // Create AlertDialog
//   AlertDialog alert = AlertDialog(
//     title: CustomText(
//       text: 'Alert!',
//       textStyle: kTextStyleWhite(22),
//     ),
//     backgroundColor: Colors.black38,
//     content: CustomText(
//       text: message,
//       textStyle: kTextStyleWhite(14),
//     ),
//     actions: [
//       CustomButton(backgroundColor: greenColor, label: 'Exit', onTap: onExit),
//       kHorizontalSpace(8),
//       CustomButton(backgroundColor: greenColor, label: 'OK', onTap: onRetry),
//     ],
//   );
//   // show the dialog
//   showDialog(
//     context: context,
//     barrierDismissible: false,
//     builder: (BuildContext context) {
//       return alert;
//     },
//   );
// }

showQRSaveDialog(BuildContext context, Widget btnSave, Widget btnShare) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        elevation: 0,
        contentPadding: const EdgeInsets.all(15),
        backgroundColor: Colors.transparent,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.cancel,
                  color: greyColor,
                ),
              ),
            ),
            kVerticalSpace(8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: context.theme.scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  kVerticalSpace(10),
                  btnSave,
                  kVerticalSpace(5),
                  const Divider(
                    color: Colors.black12,
                  ),
                  kVerticalSpace(5),
                  btnShare,
                  kVerticalSpace(10),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
