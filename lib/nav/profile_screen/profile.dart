import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hotel_akimomi/auth/launch_screen.dart';
import 'package:hotel_akimomi/controller/setting_controller.dart';
import 'package:hotel_akimomi/nav/profile_screen/paymrnt_card_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../util/constant.dart';
import '../../util/style.dart';
import '../../util/widget/custom_btn_gradient.dart';

import '../../util/widget/custom_section_title.dart';
import '../../util/widget/custom_text.dart';
import '../../util/widget/show_alert_dialog.dart';
import '_profile_screen.dart';
import 'change_password.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final SettingController settingController = Get.put(SettingController());

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    await settingController.getUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        key: _scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          title: CustomText(
            text: 'Profile',
            textStyle:
                kTextStyleCustom(16, context.theme.colorScheme.onPrimary),
          ),
          elevation: 0,
          backgroundColor: context.theme.colorScheme.surface,
        ),
        body: Obx(() {
          return SafeArea(
              child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: context.theme.colorScheme.background,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: Stack(
                            children: [
                              Center(
                                child: settingController.profile.value.image !=
                                        null
                                    ? CircleAvatar(
                                        radius: 40,
                                        child: CircleAvatar(
                                          radius: 35,
                                          child: Image.network(
                                            settingController
                                                    .profile.value.image ??
                                                "",
                                            fit: BoxFit.fill,
                                          ),
                                        ))
                                    : SvgPicture.asset(
                                        'assets/icon/profile.svg'),
                              ),
                            ],
                          ),
                        ),
                        kVerticalSpace(8),
                        CustomText(
                          // text: _controller.userProfile.value.fullName ??
                          //     (_controller.userProfile.value.username ?? ''),
                          text: settingController.profile.value.name ?? "",
                          textStyle: kTextStyleBoldCustom(
                              16, context.theme.colorScheme.primary),
                        ),
                        kVerticalSpace(12),
                        // kSpacer(Colors.grey),
                        kDivider(),
                        kVerticalSpace(12),
                        Container(
                          color: context.theme.colorScheme.background,
                          child: Column(
                            children: [
                              kSpacer(context.theme.primaryColorLight),
                              CustomSectionTitle(
                                bottomBorder: false,
                                titleColor: context.theme.colorScheme.primary,
                                onTap: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .push(MaterialPageRoute(
                                          builder: (context) =>
                                              const ProfileScreen()));
                                },
                                title: 'edit_profile'.tr,
                                icon: Icons.person,
                                iconColor: Colors.grey,
                              ),
                              kSpacer(context.theme.primaryColorLight),
                              CustomSectionTitle(
                                titleColor: context.theme.colorScheme.primary,
                                onTap: () {
                                  Get.to(() => ChangePassword(
                                        controller: settingController,
                                      ));
                                },
                                title: 'Change Password',
                                icon: Icons.lock,
                                iconColor: Colors.grey,
                              ),
                              kSpacer(context.theme.primaryColorLight),
                              CustomSectionTitle(
                                titleColor: context.theme.colorScheme.primary,
                                onTap: () {
                                  Get.to(() => const PaymentCardScreen(
                                        isFromBooking: false,
                                      ));
                                },
                                title: 'PayMent Methods',
                                icon: Icons.payment,
                                iconColor: Colors.grey,
                              ),
                              kVerticalSpace(30),
                              CustomBtnGradient(
                                  width: 130,
                                  height: 40,
                                  top: greyTopColor,
                                  bottom: greyBottomColor,
                                  onTap: () {
                                    showAlertDialog(context, 'confirmation'.tr,
                                        'logout_text'.tr, 'ok'.tr, () async {
                                      Get.back();
                                      SharedPreferences pref =
                                          await SharedPreferences.getInstance();
                                      pref.clear();
                                      Get.deleteAll();
                                      Get.to(() => const LaunchScreen());
                                      // _controller.logoutRequest(context);
                                      // _bodyController.clearChache();
                                    });
                                  },
                                  child: CustomText(
                                    text: 'logout'.tr,
                                    textStyle: kTextStyleBlack(14),
                                  )),
                              kVerticalSpace(50),
                            ],
                          ),
                        ),
                      ]),
                )
              ])));
        }));
  }
}
