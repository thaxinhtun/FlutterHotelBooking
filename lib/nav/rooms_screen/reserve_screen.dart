import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_akimomi/controller/room_controller.dart';
import 'package:hotel_akimomi/controller/setting_controller.dart';
import 'package:hotel_akimomi/util/widget/custom_text_field.dart';

import '../../util/constant.dart';
import '../../util/widget/custom_button.dart';
import '../../util/widget/custom_profile_textfield.dart';
import '../../util/widget/custom_text.dart';
import '../../util/widget/custom_title_text.dart';
import '../profile_screen/add_phone.dart';
import '../profile_screen/paymrnt_card_screen.dart';

class ReserveScreen extends StatelessWidget {
  final RoomController controller;
  final SettingController settingController;
  final String roomName;
  final int sleeps;
  final price;
  const ReserveScreen(
      {super.key,
      required this.controller,
      required this.settingController,
      required this.roomName,
      required this.sleeps,
      this.price});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: CustomText(
            text: 'Booking',
            textStyle:
                kTextStyleCustom(16, context.theme.colorScheme.onPrimary),
          ),
          elevation: 0,
          backgroundColor: context.theme.colorScheme.surface,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 220,
                child: Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          kVerticalSpace(10),
                          Center(
                            child: CustomText(
                                text: "Booking Detail",
                                textStyle: kTextStyleCustom(16, Colors.black)),
                          ),
                          kVerticalSpace(20),
                          Row(
                            children: [
                              kHorizontalSpace(10),
                              CustomText(
                                  text: "1 room: ",
                                  textStyle:
                                      kTextStyleCustom(14, Colors.black)),
                              kHorizontalSpace(8),
                              CustomText(
                                  text: roomName,
                                  textStyle:
                                      kTextStyleCustom(14, Colors.black)),
                            ],
                          ),
                          kVerticalSpace(8),
                          Row(
                            children: [
                              kHorizontalSpace(10),
                              CustomText(
                                  text: "check in: ",
                                  textStyle:
                                      kTextStyleCustom(14, Colors.black)),
                              kHorizontalSpace(8),
                              CustomText(
                                  text: dayMonthNameYearFormat
                                      .format(controller.checkInDate.value),
                                  textStyle:
                                      kTextStyleCustom(14, Colors.black)),
                            ],
                          ),
                          kVerticalSpace(8),
                          Row(
                            children: [
                              kHorizontalSpace(10),
                              CustomText(
                                  text: "check out: ",
                                  textStyle:
                                      kTextStyleCustom(14, Colors.black)),
                              kHorizontalSpace(8),
                              CustomText(
                                  text: dayMonthNameYearFormat
                                      .format(controller.checkOutDate.value),
                                  textStyle:
                                      kTextStyleCustom(14, Colors.black)),
                            ],
                          ),
                          kVerticalSpace(8),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: CustomText(
                                text: "${controller.nightStay} nights stay",
                                textStyle: kTextStyleCustom(14, Colors.black)),
                          ),
                          kVerticalSpace(8),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: CustomText(
                                text: "No Refund",
                                textStyle: kTextStyleCustom(14, Colors.red)),
                          ),
                        ],
                      ),
                    )),
              ),
              priceDetail(),
              checkinInfo(),
              kVerticalSpace(30),
              CustomButton(
                  label: 'Proceed'.tr,
                  backgroundColor: Colors.indigo,
                  textStyle: kTextStyleWhite(14),
                  onTap: () {
                    controller.choseRoomType.value = roomName;
                    controller.sleeps.value = sleeps;
                    Get.off(() => const PaymentCardScreen(
                          isFromBooking: true,
                        ));
                  }),
            ],
          ),
        ));
  }

  Widget priceDetail() {
    return SizedBox(
      height: 200,
      child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kVerticalSpace(10),
                Center(
                  child: CustomText(
                      text: "Price Detail",
                      textStyle: kTextStyleCustom(16, Colors.black)),
                ),
                kVerticalSpace(20),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomText(
                              text: "1 room * ${controller.nightStay} night ",
                              textStyle: kTextStyleCustom(16, Colors.black)),
                          kVerticalSpace(5),
                          CustomText(
                              text: "${controller.price} per night",
                              textStyle: kTextStyleCustom(12, Colors.black)),
                        ],
                      ),
                      CustomText(
                          text: "${controller.totalPrice}  ",
                          textStyle: kTextStyleCustom(16, Colors.black)),
                    ],
                  ),
                ),
                kVerticalSpace(5),
                kDivider(),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                          text: "Total ",
                          textStyle: kTextStyleCustom(16, Colors.black)),
                      CustomText(
                          text: "${controller.totalPrice}  ",
                          textStyle: kTextStyleCustom(16, Colors.black)),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Widget checkinInfo() {
    return SizedBox(
      height: 400,
      child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  kVerticalSpace(10),
                  Center(
                    child: CustomText(
                        text: "Check In User Info",
                        textStyle: kTextStyleCustom(16, Colors.black)),
                  ),
                  kVerticalSpace(20),
                  CustomProfileTextfield(
                    label: 'user_name'.tr,
                    hintText: settingController.profile.value.name ?? "",
                    readOnly: true,
                  ),
                  kVerticalSpace(8),
                  kDivider(),
                  CustomProfileTextfield(
                    label: 'full_name'.tr,
                    hintText: settingController.profile.value.fullName ?? "",
                    readOnly: true,
                  ),
                  kVerticalSpace(8),
                  kDivider(),
                  CustomProfileTextfield(
                    label: 'email'.tr,
                    hintText: settingController.profile.value.email ?? "",
                    readOnly: true,
                  ),
                  kVerticalSpace(8),
                  kDivider(),
                  settingController.profile.value.phno == '' ||
                          settingController.profile.value.phno == null
                      ? CustomTitleText(
                          onTap: () {
                            Get.to(() => AddPhone(
                                  controller: settingController,
                                ));
                          },
                          description: 'verify_phone_no'.tr,
                          title: 'phoneno'.tr)
                      : CustomProfileTextfield(
                          label: 'phoneno'.tr,
                          hintText: settingController.profile.value.phno ?? "",
                          readOnly: true,
                        ),
                  kVerticalSpace(8),
                ],
              ),
            ),
          )),
    );
  }
}
