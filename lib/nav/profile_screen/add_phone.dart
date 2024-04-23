import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/setting_controller.dart';
import '../../util/constant.dart';
import '../../util/widget/custom_appbar.dart';
import '../../util/widget/custom_btn_gradient.dart';
import '../../util/widget/custom_text.dart';
import '../../util/widget/custom_text_field.dart';
import '../../util/widget/show_alert_dialog.dart';

class AddPhone extends StatelessWidget {
  final SettingController controller;
  AddPhone({Key? key, required this.controller}) : super(key: key);

  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: const CustomAppBar(
        title: '',
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomText(
              text: 'add_phone_no'.tr,
              textStyle:
                  kTextStyleCustom(16, context.theme.colorScheme.primary)),
          kVerticalSpace(20),
          CustomTextField(
            isKeyboardTypeNumber: true,
            label: 'phoneno'.tr,
            hintText: '09',
            controller: phoneController,
          ),
          kVerticalSpace(20),
          Center(
            child: CustomBtnGradient(
                width: 120.w,
                height: 40.h,
                onTap: () {
                  if (phoneController.text.isEmpty) {
                    showAlertDialog(
                        context, 'Error', 'Please fill Phone no!', 'OK', () {
                      Navigator.pop(context);
                    });
                  } else {
                    controller.phoneVerify(phoneController.text);
                  }
                },
                child: CustomText(
                  text: 'Save'.tr,
                  textStyle: kTextStyleWhite(14),
                )),
          )
        ]),
      ),
    );
  }
}
