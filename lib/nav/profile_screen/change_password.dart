import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/setting_controller.dart';
import '../../util/constant.dart';
import '../../util/style.dart';
import '../../util/widget/custom_appbar.dart';
import '../../util/widget/custom_btn_gradient.dart';
import '../../util/widget/custom_text.dart';
import '../../util/widget/custom_text_field.dart';
import '../../util/widget/show_alert_dialog.dart';

class ChangePassword extends StatelessWidget {
  final SettingController controller;
  ChangePassword({Key? key, required this.controller}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: const CustomAppBar(
        title: '',
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            CustomText(
                text: 'change_password'.tr,
                textStyle:
                    kTextStyleCustom(16, context.theme.colorScheme.primary)),
            kVerticalSpace(20),
            CustomTextField(
              label: 'email'.tr,
              hintText: '',
              controller: emailController,
              isObsecure: false,
            ),
            kVerticalSpace(12),
            CustomTextField(
              label: 'new_password'.tr,
              hintText: '',
              controller: newPasswordController,
              isObsecure: true,
            ),
            kVerticalSpace(4),
            CustomText(
                text: 'change_password_text'.tr, textStyle: kTextStyleGrey(12)),
            kVerticalSpace(12),
            CustomTextField(
              label: 'confirm_password'.tr,
              hintText: '',
              controller: confirmPasswordController,
              isObsecure: true,
            ),
            kVerticalSpace(30),
            Center(
              child: CustomBtnGradient(
                  width: 120.w,
                  height: 40.h,
                  top: topColor,
                  bottom: bottomColor,
                  onTap: () {
                    if (newPasswordController.text.isEmpty ||
                        confirmPasswordController.text.isEmpty ||
                        emailController.text.isEmpty) {
                      showAlertDialog(
                          context, 'Error', 'Please fill all the fields!', 'OK',
                          () {
                        Navigator.pop(context);
                      });
                    } else if (newPasswordController.text ==
                        confirmPasswordController.text) {
                      // controller.updatePassword(newPasswordController.text,
                      //     oldPasswordController.text);
                      controller.changePassword(
                          emailController.text, newPasswordController.text);
                    } else {
                      showAlertDialog(
                          context,
                          'Error',
                          'Confirm password must be same with password!',
                          'OK', () {
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
        ),
      ),
    );
  }
}
