import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../common/do_not_have_account.dart';
import '../controller/common_controller.dart';
import '../util/constant.dart';
import '../util/widget/custom_button.dart';
import '../util/widget/custom_loading_btn.dart';
import '../util/widget/custom_text.dart';
import '../util/widget/custom_text_field.dart';
import 'forgot_password_request_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

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
                        const Center(
                          child: CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  AssetImage('assets/img/logo.jpg')),
                        ),
                        kVerticalSpace(20),
                        Center(
                            child: CustomText(
                          text: 'Hotel Akimomi',
                          textStyle:
                              kTextStyleTitle(20, context.theme.primaryColor),
                        )),
                        kVerticalSpace(8),
                        Center(
                            child: CustomText(
                          text: 'login'.tr,
                          textStyle:
                              kTextStyleTitle(20, context.theme.primaryColor),
                        )),
                        kVerticalSpace(30),
                        Column(
                          children: [
                            // kTextFieldTitle('phoneno_username'.tr,
                            //     context.theme.focusColor),
                            CustomTextField(
                              label: 'email'.tr,
                              hintText: '',
                              controller: value.emailController,
                            ),
                          ],
                        ),
                        kVerticalSpace(10),
                        Column(
                          children: [
                            // kTextFieldTitle(
                            //     'password'.tr, context.theme.focusColor),
                            CustomTextField(
                              label: 'password'.tr,
                              hintText: "",
                              controller: value.passwordController,
                              isObsecure: value.passwordSeen,
                              showSuffixIcon: true,
                              updateSeen: () {
                                value.passwordSeen = !value.passwordSeen;
                                value.update();
                              },
                            ),
                          ],
                        ),
                        kVerticalSpace(2),
                        GestureDetector(
                          onTap: () {
                            Get.off(() => const ForgotPasswordRequestScreen());
                          },
                          child: kTextFieldTitle(
                              'forgot_password'.tr, context.theme.focusColor),
                        ),
                        kVerticalSpace(15),
                        value.isLoading
                            ? const Center(
                                child: SizedBox(
                                    width: 180, child: CustomLoadingButton()),
                              )
                            : Center(
                                child: CustomButton(
                                  backgroundColor: context.theme.primaryColor,
                                  textStyle: kTextStyleWhite(14),
                                  label: 'login'.tr,
                                  onTap: () {
                                    if (value.validateField()) {
                                      value.saveLogin(context);
                                    } else {
                                      showToast("Please fill all fields!");
                                    }
                                  },
                                ),
                              ),
                        const Spacer(),
                        // kVerticalSpace(30),
                        const Center(
                          child: DonnotHaveAccount(),
                        ),
                        kVerticalSpace(10),
                        // Center(child: TermsAndConditionWidget()),
                        const Spacer(),
                      ],
                    )),
              ),
            );
          },
        ));
  }
}
