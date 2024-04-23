import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/setting_controller.dart';
import '../../util/constant.dart';
import '../../util/style.dart';
import '../../util/widget/custom_appbar.dart';
import '../../util/widget/custom_btn_gradient.dart';
import '../../util/widget/custom_text.dart';
import '../../util/widget/show_alert_dialog.dart';

class ChangePhone extends StatelessWidget {
  final SettingController controller;
  ChangePhone({Key? key, required this.controller}) : super(key: key);

  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: const CustomAppBar(
        title: '',
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        kVerticalSpace(12),
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 4),
          child: CustomText(
              text: 'change_phoneno'.tr,
              textStyle:
                  kTextStyleCustom(16, context.theme.colorScheme.primary)),
        ),
        kVerticalSpace(20),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: CustomText(
            text: 'new_no'.tr,
            textStyle: kTextStyleGrey(14),
          ),
        ),
        kVerticalSpace(8),
        Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(
                      width: 1, color: context.theme.primaryColorLight),
                  bottom: BorderSide(
                      width: 1, color: context.theme.primaryColorLight)),
              color: context.theme.colorScheme.outline),
          child: Align(
            alignment: Alignment.centerLeft,
            child: CustomText(
              text: 'Myanmar(Burma)',
              textStyle: TextStyle(
                  fontSize: 14, color: context.theme.colorScheme.primary),
            ),
          ),
        ),
        Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      width: 1, color: context.theme.primaryColorLight)),
              color: context.theme.colorScheme.outline),
          child: Center(
            child: Row(
              children: [
                // CustomText(
                //   text: '+95',
                //   textStyle: TextStyle(
                //       fontSize: 14, color: context.theme.colorScheme.primary),
                // ),
                // kHorizontalSpace(12),
                Container(
                  width: 1,
                  color: context.theme.primaryColorLight,
                ),
                Expanded(
                  child: SizedBox(
                    height: 45,
                    child: TextField(
                      controller: phoneController,
                      style: kTextStyleCustom(
                          16, context.theme.colorScheme.primary),
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          filled: true,
                          fillColor: context.theme.colorScheme.outline,
                          contentPadding: const EdgeInsets.only(left: 8),
                          hintText: '',
                          hintStyle: kTextStyleGrey(16),
                          border: _borders(),
                          enabledBorder: _borders(),
                          focusedBorder: _borders(),
                          disabledBorder: _borders()),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // kVerticalSpace(4),
        // Padding(
        //   padding: const EdgeInsets.only(left: 15),
        //   child: CustomText(
        //       text: 'change_no_text'.tr, textStyle: kTextStyleGrey(12)),
        // ),
        kVerticalSpace(30),
        Center(
          child: CustomBtnGradient(
              width: 120.w,
              height: 40.h,
              top: topColor,
              bottom: bottomColor,
              onTap: () {
                if (phoneController.text.isNotEmpty) {
                  phoneController.text = phoneController.text;

                  controller.phoneVerify(phoneController.text);
                } else {
                  showAlertDialog(
                      context, 'Error', 'Please fill all the fields!', 'OK',
                      () {
                    Navigator.pop(context);
                  });
                }
              },
              child: CustomText(
                text: 'save'.tr,
                textStyle: kTextStyleWhite(14),
              )),
        )
      ]),
    );
  }

  _borders() {
    return const OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: Colors.transparent));
  }
}
