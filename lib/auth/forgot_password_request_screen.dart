import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../common/do_not_have_account.dart';
import '../common/rounded_corner_btn.dart';
import '../controller/common_controller.dart';
import '../util/constant.dart';
import '../util/widget/custom_loading_btn.dart';
import '../util/widget/custom_text.dart';
import '../util/widget/custom_text_field.dart';
import 'login_screen.dart';

class ForgotPasswordRequestScreen extends StatelessWidget {
  const ForgotPasswordRequestScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: GetBuilder<CommonController>(
        init: CommonController(),
        builder: (value) {
          return SafeArea(
            child: SingleChildScrollView(
                child: Container(
              padding: const EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  kVerticalSpace(40.h),
                  // ComWidgets().logoWidget(),
                  Center(
                      child: CustomText(
                    text: 'forgot_password'.tr,
                    textStyle: kTextStyleTitle(20, context.theme.primaryColor),
                  )),
                  kVerticalSpace(15),
                  Center(
                      child: CustomText(
                    text: 'reset password link will be sent'.tr,
                    textStyle:
                        kTextStyleCustom(14, context.theme.colorScheme.primary),
                  )),
                  Center(
                      child: CustomText(
                    text: 'to your email',
                    textStyle:
                        kTextStyleCustom(14, context.theme.colorScheme.primary),
                  )),
                  kVerticalSpace(15),
                  CustomTextField(
                    label: 'email'.tr,
                    hintText: '',
                    controller: value.forgotPasswordController,
                  ),
                  kVerticalSpace(35),
                  FractionallySizedBox(
                    widthFactor: 0.6,
                    child: value.isLoading
                        ? const CustomLoadingButton()
                        : RoundedCornerButton(
                            onPressed: () {
                              if (value
                                  .forgotPasswordController.text.isNotEmpty) {
                                FocusManager.instance.primaryFocus?.unfocus();
                                value.resetPassword(
                                    value.forgotPasswordController.text,
                                    context);
                              } else {
                                showToast('please enter email!');
                              }
                            },
                            buttonTitle: 'send reset link',
                            width: 0,
                            backgroundColor: context.theme.primaryColor,
                            foregroundColor: Colors.white,
                          ),
                  ),
                  kVerticalSpace(10),
                  Center(
                    child: GestureDetector(
                        onTap: () {
                          Get.off(() => const LoginScreen());
                        },
                        child: CustomText(
                          text: 'cancel'.tr,
                          textStyle: kTextStyleGrey(14),
                        )),
                  ),
                  const Spacer(),
                  const Center(
                    child: DonnotHaveAccount(),
                  ),
                  kVerticalSpace(10.0),
                  const Spacer(),
                ],
              ),
            )),
          );
        },
      ),
    );
  }
}
