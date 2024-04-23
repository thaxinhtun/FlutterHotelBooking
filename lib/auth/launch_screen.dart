import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hotel_akimomi/auth/sign_up_screen.dart';

import '../controller/common_controller.dart';
import '../controller/sign_up_controller.dart';
import '../util/constant.dart';
import '../util/launch_screen_button.dart';
import '../util/style.dart';
import '../util/widget/custom_button.dart';
import '../util/widget/custom_loading.dart';
import 'login_screen.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  final SignupController _controller = Get.put(SignupController());
  final CommonController commonsController = Get.put(CommonController());
  final GlobalKey _one = GlobalKey();

  @override
  // void initState() {
  //   WidgetsBinding.instance.addPostFrameCallback(
  //       (_) => ShowCaseWidget.of(context).startShowCase([_one]));
  //   if (!commonsController.signUpwithPhShowcase.value) {
  //     commonsController.isSingUpStepsCard.value = true;
  //   }
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Obx(() {
      return Scaffold(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),
                      // ComWidgets().logoWidget(),
                      const Center(
                        child: CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('assets/img/logo.jpg')),
                      ),
                      SizedBox(
                        height: spaceMedium,
                      ),
                      Text(
                        "Hotel Akimomi",
                        style: TextStyle(
                            color: context.theme.primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: spaceMedium,
                      ),
                      //Login Section
                      LaunchScreenButton(
                        backgroundColor: backgroundDarkPurple,
                        label: 'login'.tr,
                        onTap: () {
                          Get.off(() => const LoginScreen());
                        },
                        textStyle: kTextStyleWhite(14),
                      ),
                      //SignUp Methods Section
                      signUpMethods(),

                      // commonsController.isSingUpMethodsShowCase.value
                      //     ? Column(
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         children: [
                      //           Image.asset("assets/icon/userGuideArrow.png"),
                      //           kVerticalSpace(20),
                      //           const CustomText(
                      //               text:
                      //                   "ကြိုက်နှစ်သက်ရာ တစ်ခုဖြင့် ဝင်​ပေးပါ။",
                      //               textStyle: TextStyle(
                      //                   color: whiteColor,
                      //                   fontSize: 15,
                      //                   fontWeight: FontWeight.w800))
                      //         ],
                      //       )
                      //     : Container(),
                      const Spacer(),

                      //Language Section

                      kVerticalSpace(20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget signUpMethods() {
    return Column(
      children: [
        //SignUp with Google Section
        LaunchScreenButton(
          onTap: () async {
            _controller.signInWithGoogle(context);
          },
          backgroundColor: context.theme.colorScheme.outline,
          textStyle: kTextStyleCustom(14, context.theme.focusColor),
          label: "continue_with_google".tr,
          widget: _controller.googleSignInLoading.value
              ? const CustomLoading(
                  size: 30,
                )
              : SvgPicture.asset(
                  'assets/icon/google_icon.svg',
                  allowDrawingOutsideViewBox: true,
                ),
        ),

        //SingUp with Facebook Section
        // LaunchScreenButton(
        //   onTap: () async {
        //     _controller.signInWithFacebook(context);
        //   },
        //   backgroundColor: context.theme.colorScheme.outline,
        //   label: 'continue_with_facebook'.tr,
        //   textStyle: kTextStyleCustom(14, context.theme.focusColor),
        //   widget: _controller.fbSignInLoading.value
        //       ? const CustomLoading(
        //           size: 30,
        //         )
        //       : SvgPicture.asset(
        //           'assets/icon/fb_icon.svg',
        //           allowDrawingOutsideViewBox: true,
        //         ),
        // ),

        //SignUp with Apple ID section
        // Platform.isIOS
        //     ? LaunchScreenButton(
        //         onTap: () async {
        //           _controller.signInWithApple(context);
        //         },
        //         backgroundColor: context.theme.colorScheme.outline,
        //         label: 'continue_with_apple'.tr,
        //         textStyle: kTextStyleCustom(14, context.theme.focusColor),
        //         widget: _controller.appleSignInLoading.value
        //             ? const CustomLoading(
        //                 size: 30,
        //               )
        //             : Icon(
        //                 Icons.apple,
        //                 color: context.theme.focusColor,
        //               ),
        //       )
        //     : Container(),
        // const SizedBox(
        //   height: 16,
        // ),
        //SignUp Section
        CustomButton(
            label: 'signup'.tr,
            backgroundColor: greenColor,
            textStyle: kTextStyleWhite(14),
            onTap: () {
              Get.off(() => SignUpScreen());
            }),
      ],
    );
  }
}
