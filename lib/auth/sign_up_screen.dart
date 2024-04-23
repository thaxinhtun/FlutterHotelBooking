import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_akimomi/auth/login_screen.dart';
import 'package:hotel_akimomi/controller/sign_up_controller.dart';

import '../common/rounded_corner_btn.dart';
import '../util/constant.dart';
import '../util/style.dart';
import '../util/widget/custom_loading_btn.dart';
import '../util/widget/custom_text.dart';
import '../util/widget/custom_text_field.dart';
import '../util/widget/show_alert_dialog.dart';
import 'launch_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  final TextEditingController usernameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final RegExp englishRegex =
      RegExp(r'^[a-zA-Z0-9!@#$%^&*()_+\-=\[\]{}|;:",.<>\/?\\~]+$');

  bool validEnglish(String value) {
    return (!englishRegex.hasMatch(value)) ? false : true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        body: GetBuilder<SignupController>(
          init: SignupController(),
          builder: (value) {
            return SafeArea(
              child: Container(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      kVerticalSpace(50),
                      const Center(
                        child: CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('assets/img/logo.jpg')),
                      ),
                      kVerticalSpace(20),
                      // ComWidgets().logoWidget(),

                      Center(
                          child: CustomText(
                        text: 'Hotel Akimomi',
                        textStyle:
                            kTextStyleTitle(20, context.theme.primaryColor),
                      )),
                      kVerticalSpace(8),
                      Center(
                          child: CustomText(
                        text: 'signup'.tr,
                        textStyle:
                            kTextStyleTitle(20, context.theme.primaryColor),
                      )),

                      kVerticalSpace(30),
                      CustomTextField(
                        label: 'username'.tr,
                        hintText: "",
                        controller: usernameController,
                        onChange: (text) {
                          if (!validEnglish(text)) {
                            usernameController.text = "";
                            showAlertDialog(
                                context, 'info'.tr, 'disable_mm'.tr, 'ok'.tr,
                                () {
                              Navigator.pop(context);
                            });
                          }
                        },
                      ),
                      kVerticalSpace(20),
                      CustomTextField(
                        label: 'email'.tr,
                        hintText: "",
                        controller: emailController,
                        onChange: (text) {
                          if (!validEnglish(text)) {
                            emailController.text = "";
                            showAlertDialog(
                                context, 'info'.tr, 'disable_mm'.tr, 'ok'.tr,
                                () {
                              Navigator.pop(context);
                            });
                          }
                        },
                      ),
                      kVerticalSpace(20),
                      CustomTextField(
                        label: 'password'.tr,
                        hintText: "",
                        controller: passwordController,
                        isObsecure: value.passwordSeen,
                        showSuffixIcon: true,
                        onChange: (text) {
                          if (!validEnglish(text)) {
                            passwordController.text = "";
                            showAlertDialog(
                                context, 'info'.tr, 'disable_mm'.tr, 'ok'.tr,
                                () {
                              Navigator.pop(context);
                            });
                          }
                        },
                        updateSeen: () {
                          value.passwordSeen = !value.passwordSeen;
                          value.update();
                        },
                      ),
                      kVerticalSpace(20),
                      CustomTextField(
                        label: 'comfirm_password'.tr,
                        hintText: "",
                        controller: confirmPasswordController,
                        isObsecure: value.confirmSeen,
                        showSuffixIcon: true,
                        onChange: (text) {
                          if (!validEnglish(text)) {
                            confirmPasswordController.text = "";
                            showAlertDialog(
                                context, 'info'.tr, 'disable_mm'.tr, 'ok'.tr,
                                () {
                              Navigator.pop(context);
                            });
                          }
                        },
                        updateSeen: () {
                          value.confirmSeen = !value.confirmSeen;
                          value.update();
                        },
                      ),
                      kVerticalSpace(20),
                      // TermsAndConditionAgree(
                      //   isCheck: value.checkBox,
                      //   onChanged: (valueChanged) {
                      //     value.updateCheckBox(valueChanged);
                      //   },
                      // ),
                      // kVerticalSpace(10),
                      Padding(
                          padding: EdgeInsets.only(
                              left: spaceLeft, right: spaceRight),
                          child: FractionallySizedBox(
                            widthFactor: 0.6,
                            child: value.isLoading
                                ? const CustomLoadingButton()
                                : RoundedCornerButton(
                                    onPressed: () {
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                      value.signupValidate(
                                          context,
                                          usernameController.text,
                                          emailController.text,
                                          passwordController.text,
                                          confirmPasswordController.text);
                                    },
                                    buttonTitle: 'signup'.tr,
                                    width: 0,
                                    backgroundColor: context.theme.primaryColor,
                                    foregroundColor: Colors.white,
                                  ),
                          )),
                      // kVerticalSpace(10),
                      // Center(
                      //   child: GestureDetector(
                      //       onTap: () {
                      //         // Get.off(() => LaunchScreen());
                      //       },
                      //       child: CustomText(
                      //         text: 'cancel'.tr,
                      //         textStyle: kTextStyleCustom(14, greyColor),
                      //       )),
                      // ),
                      kVerticalSpace(40),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Get.off(() => const LoginScreen());
                          },
                          child: RichText(
                            text: TextSpan(
                              text: 'already_have_account'.tr,
                              style: kTextStyleGrey(13),
                              children: [
                                TextSpan(
                                  text: ' login'.tr,
                                  style: kTextStyleGreen(12),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.off(() => const LaunchScreen());
                        },
                        child: Center(
                          child: CustomText(
                            text: 'try_another_way'.tr,
                            textStyle: kTextStyleCustom(
                                14, context.theme.primaryColor),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
