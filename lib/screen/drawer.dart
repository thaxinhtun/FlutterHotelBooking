import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hotel_akimomi/auth/launch_screen.dart';

import '../util/widget/custom_section_title.dart';
import 'admin_screen/modify_rooms.dart';
import 'admin_screen/view_booking_screen.dart';
import 'admin_screen/view_payment_transaction.dart';
import 'admin_screen/view_userList.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.indigo[500],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), bottomRight: Radius.circular(30)),
        ),
        child: SafeArea(
          bottom: false,
          child: Column(children: [
            // kVerticalSpace(30),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Admin DashBoard",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),

            const SizedBox(
              height: 30,
            ),
            CustomSectionTitle(
              onTap: () {
                Get.to(() => const ViewUserList());
              },
              title: 'Users'.tr,
              backgroundColor: context.theme.colorScheme.secondary,
              titleColor: Colors.white,
              noBorder: true,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomSectionTitle(
              onTap: () {
                Get.to(() => const RoomModifyScreen());
              },
              title: 'Rooms'.tr,
              backgroundColor: context.theme.colorScheme.secondary,
              titleColor: Colors.white,
              noBorder: true,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomSectionTitle(
              onTap: () {
                Get.to(() => const ViewBookingScreen());
              },
              title: 'Booking'.tr,
              backgroundColor: context.theme.colorScheme.secondary,
              titleColor: Colors.white,
              noBorder: true,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomSectionTitle(
              onTap: () {
                Get.to(() => const ViewPaymentTransactions());
              },
              title: 'Payment Transactions'.tr,
              backgroundColor: context.theme.colorScheme.secondary,
              titleColor: Colors.white,
              noBorder: true,
            ),
            InkWell(
              onTap: () {
                Get.to(() => LaunchScreen());
              },
              child: const Padding(
                padding: EdgeInsets.only(left: 50, top: 20),
                child: Row(
                  children: [
                    Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Logout",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            )
            // Expanded(
            //   child: Container(
            //     decoration: BoxDecoration(
            //         color: context.theme.scaffoldBackgroundColor,
            //         borderRadius: const BorderRadius.only(
            //             bottomRight: Radius.circular(30))),
            //     child: SingleChildScrollView(
            //       child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             // kVerticalSpace(15),
            //             SizedBox(
            //               height: 15,
            //             ),
            //             // Padding(
            //             //   padding: const EdgeInsets.only(left: 15.0),
            //             //   child: CustomText(
            //             //     text: 'You have',
            //             //     textStyle: kTextStyleCustom(
            //             //         14, context.theme.primaryColorDark),
            //             //   ),
            //             // ),
            //             // kVerticalSpace(8),
            //             // InkWell(
            //             //   onTap: () {
            //             //     context.next(PointScreen(
            //             //       controller: _controller,
            //             //       points: _controller.points.value,
            //             //     ));
            //             //   },
            //             //   child: Padding(
            //             //     padding: const EdgeInsets.only(left: 15.0),
            //             //     child: Row(
            //             //       children: [
            //             //         CustomText(
            //             //           text: _controller.points.value,
            //             //           textStyle: kTextStyleCustom(22,
            //             //               context.theme.colorScheme.primary),
            //             //         ),
            //             //         CustomText(
            //             //           text: ' Points',
            //             //           textStyle: kTextStyleCustom(
            //             //               14, context.theme.primaryColorDark),
            //             //         ),
            //             //       ],
            //             //     ),
            //             //   ),
            //             // ),
            //             // kVerticalSpace(15),
            //             // kDivider(),
            //             CustomSectionTitle(
            //               onTap: () {
            //                 // context.next(BMIScreen());
            //               },
            //               title: 'bmi_calculation'.tr,
            //               backgroundColor: context.theme.colorScheme.secondary,
            //               titleColor: context.theme.colorScheme.primary,
            //               noBorder: true,
            //               widget: SizedBox(
            //                 width: 30,
            //                 height: 30,
            //                 child: Image.asset(
            //                   'assets/img/bmi.png',
            //                   width: 30,
            //                   height: 30,
            //                 ),
            //               ),
            //             ),
            //             // kVerticalSpace(2),
            //             SizedBox(
            //               height: 2,
            //             ),
            //             CustomSectionTitle(
            //               onTap: () {
            //                 // context.next(MyGiftCardScreen(
            //                 //   settingController: _controller,
            //                 // ));
            //               },
            //               title: 'my_gift_card'.tr,
            //               backgroundColor: context.theme.colorScheme.secondary,
            //               titleColor: context.theme.colorScheme.primary,
            //               noBorder: true,
            //             ),
            //             // CustomSectionTitle(
            //             //   onTap: () {
            //             //     context.next(const SpinWheel());
            //             //   },
            //             //   title: 'spin'.tr,
            //             //   backgroundColor:
            //             //       context.theme.colorScheme.secondary,
            //             //   titleColor: context.theme.colorScheme.primary,
            //             //   noBorder: true,
            //             //   widget: SizedBox(
            //             //     width: 30,
            //             //     height: 30,
            //             //     child: Image.asset(
            //             //       'assets/img/spin.png',
            //             //       width: 30,
            //             //       height: 30,
            //             //     ),
            //             //   ),
            //             // ),
            //             // kVerticalSpace(2),
            //             SizedBox(
            //               height: 2,
            //             ),
            //             CustomSectionTitle(
            //               onTap: () async {
            //                 // var referlink =
            //                 //     await deeplinkService.createReferLink(
            //                 //         initService.getUserId.toString(), );
            //                 // context.next(InviteScreen(
            //                 //   controller: _controller,
            //                 //   referlink: referlink,
            //                 // ));
            //               },
            //               title: 'invite_friend'.tr,
            //               backgroundColor: context.theme.colorScheme.secondary,
            //               titleColor: context.theme.colorScheme.primary,
            //               noBorder: true,
            //             ),
            //             // kVerticalSpace(2),
            //             SizedBox(
            //               height: 2,
            //             ),
            //             CustomSectionTitle(
            //               onTap: () {
            //                 // context.next(const TermAndConditionScreen());
            //               },
            //               title: 'terms_and_conditions'.tr,
            //               backgroundColor: context.theme.colorScheme.secondary,
            //               titleColor: context.theme.colorScheme.primary,
            //               noBorder: true,
            //             ),
            //             // kVerticalSpace(2),
            //             SizedBox(
            //               height: 2,
            //             ),
            //             CustomSectionTitle(
            //               onTap: () {
            //                 // context.next(PrivacyPolicyScreen(
            //                 //   controller: _controller,
            //                 // ));
            //               },
            //               title: 'privacy_policy'.tr,
            //               backgroundColor: context.theme.colorScheme.secondary,
            //               titleColor: context.theme.colorScheme.primary,
            //               noBorder: true,
            //             ),
            //             // kVerticalSpace(2),
            //             SizedBox(
            //               height: 2,
            //             ),
            //             CustomSectionTitle(
            //               onTap: () {
            //                 // context.next(AboutUs(
            //                 //   controller: _controller,
            //                 // ));
            //               },
            //               title: 'about_chitmaymay'.tr,
            //               backgroundColor: context.theme.colorScheme.secondary,
            //               titleColor: context.theme.colorScheme.primary,
            //               noBorder: true,
            //             ),
            //             // kVerticalSpace(2),
            //             SizedBox(
            //               height: 2,
            //             ),
            //             CustomSectionTitle(
            //               onTap: () {},
            //               title: 'version'.tr,
            //               backgroundColor: context.theme.colorScheme.secondary,
            //               titleColor: context.theme.colorScheme.primary,
            //               noBorder: true,
            //               isAlignRight: true,
            //               widget: Text(
            //                   // _controller.version.value,
            //                   // style: kTextStyleGrey(14),
            //                   ),
            //             ),
            //           ]),
            //     ),
            //   ),
            // )
          ]),
        ));
  }
}
