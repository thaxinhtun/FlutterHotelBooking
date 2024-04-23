import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_akimomi/controller/room_controller.dart';
import 'package:hotel_akimomi/controller/setting_controller.dart';
import 'package:hotel_akimomi/nav/rooms_screen/reserve_screen.dart';
import 'package:hotel_akimomi/nav/rooms_screen/room%20_amenities.dart';
import 'package:hotel_akimomi/util/constant.dart';
import 'package:hotel_akimomi/util/widget/custom_button.dart';
import 'package:hotel_akimomi/util/widget/show_alert_dialog.dart';

import '../../util/style.dart';
import '../../util/widget/custom_loading.dart';
import '../../util/widget/custom_text.dart';

import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as picker;

class RoomCategoryScreen extends StatefulWidget {
  final String roomName;
  final int squareFoot;
  final int sleeps;
  final int doubleBedRooms;
  final int twinBedRooms;
  final List<String> imageSliders;
  final RoomController roomController;

  const RoomCategoryScreen({
    super.key,
    required this.roomName,
    required this.squareFoot,
    required this.sleeps,
    required this.doubleBedRooms,
    required this.twinBedRooms,
    required this.imageSliders,
    required this.roomController,
  });

  @override
  State<RoomCategoryScreen> createState() => _RoomCategoryScreenState();
}

class _RoomCategoryScreenState extends State<RoomCategoryScreen> {
  final SettingController settingController = Get.put(SettingController());
  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {}

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          height: widget.roomController.isDateAvailable.value ? 670 : 500,
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 7,
              shadowColor: blackColor,
              color: context.theme.colorScheme.outline,
              child: Column(
                children: [
                  CarouselSlider.builder(
                    itemCount: widget.imageSliders.length,
                    itemBuilder: (context, index, realIndex) => GestureDetector(
                      onTap: () async {},
                      child: Image.network(
                        widget.imageSliders[index],
                        fit: BoxFit.fill,
                      ),
                    ),
                    options: CarouselOptions(
                      viewportFraction: 1,
                      autoPlay: true,
                    ),
                  ),
                  kVerticalSpace(12),
                  CustomText(
                    text: widget.roomName,
                    textStyle: kTextStyleCustom(16, Colors.black),
                    isAlignCenter: false,
                  ),
                  kVerticalSpace(20),
                  Row(
                    children: [
                      kHorizontalSpace(12),
                      const Icon(Icons.square_foot),
                      kHorizontalSpace(12),
                      CustomText(
                          text: "${widget.squareFoot} sq ft",
                          textStyle: kTextStyleCustom(14, Colors.black))
                    ],
                  ),
                  kVerticalSpace(8),
                  Row(
                    children: [
                      kHorizontalSpace(12),
                      const Icon(Icons.person),
                      kHorizontalSpace(12),
                      CustomText(
                          text: "Sleeps ${widget.sleeps}",
                          textStyle: kTextStyleCustom(14, Colors.black))
                    ],
                  ),
                  kVerticalSpace(8),
                  Row(
                    children: [
                      kHorizontalSpace(12),
                      const Icon(Icons.bed),
                      kHorizontalSpace(12),
                      CustomText(
                          text: "${widget.doubleBedRooms} Double Bed",
                          textStyle: kTextStyleCustom(14, Colors.black))
                    ],
                  ),
                  kVerticalSpace(8),
                  Row(
                    children: [
                      kHorizontalSpace(12),
                      InkWell(
                        onTap: () {
                          Get.to(() =>
                              RoomAmenities(controller: widget.roomController));
                        },
                        child: CustomText(
                            text: "More details",
                            textStyle: kTextStyleCustom(
                                14, context.theme.colorScheme.surface)),
                      ),
                      kHorizontalSpace(8),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 14,
                        color: context.theme.colorScheme.surface,
                      ),
                    ],
                  ),
                  widget.roomController.isDateAvailable.value
                      ? totalPriceWidget()
                      : Container(),
                  kVerticalSpace(25),
                  widget.roomController.isDateAvailable.value
                      ? Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: CustomText(
                              text:
                                  "We have ${widget.roomController.leftRooms.value} left",
                              textStyle: kTextStyleCustom(12, Colors.redAccent),
                              isAlignCenter: false,
                            ),
                          ),
                        )
                      : Container(),
                  kVerticalSpace(10),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Align(
                        alignment: Alignment.bottomRight,
                        child: CustomButton(
                            label: !widget.roomController.isChooseDate.value
                                ? "Choose your dates"
                                : widget.roomController.isDateAvailable.value
                                    ? "Reserve"
                                    : "Change Date",
                            onTap: () async {
                              if (widget.roomController.isDateAvailable.value) {
                                Get.to(() => ReserveScreen(
                                      controller: widget.roomController,
                                      settingController: settingController,
                                      roomName: widget.roomName,
                                      sleeps: widget.sleeps,
                                    ));
                              } else {
                                DateTimeRange selectedDates = DateTimeRange(
                                    start: DateTime.now(), end: DateTime.now());

                                final DateTimeRange? dateTimeRange =
                                    await showDateRangePicker(
                                        context: context,
                                        initialEntryMode:
                                            DatePickerEntryMode.calendarOnly,
                                        firstDate: DateTime(
                                            2024,
                                            DateTime.now().month,
                                            DateTime.now().day),
                                        lastDate: DateTime(2025),
                                        useRootNavigator: true);
                                if (dateTimeRange != null) {
                                  debugPrint(
                                      "Start Date ===> ${dateTimeRange.start}");
                                  debugPrint(
                                      "End Date ===> ${dateTimeRange.end}");
                                  widget.roomController.checkInDate.value =
                                      dateTimeRange.start;
                                  widget.roomController.checkOutDate.value =
                                      dateTimeRange.end;
                                  widget.roomController.refunableDate.value =
                                      widget.roomController.checkInDate.value
                                          .subtract(const Duration(days: 2));
                                  widget.roomController.isChooseDate.value =
                                      true;

                                  await FirebaseFirestore.instance
                                      .collection('rooms')
                                      .where('room_type',
                                          isEqualTo: widget.roomName)
                                      .get()
                                      .then((QuerySnapshot querySnapshot) {
                                    if (querySnapshot.docs.isNotEmpty) {
                                      debugPrint(
                                          'Document data: ${querySnapshot.docs[0].data()}');
                                      Map<String, dynamic> data =
                                          querySnapshot.docs[0].data()
                                                  as Map<String, dynamic>? ??
                                              {};
                                      debugPrint(
                                          "Data ===> ${data["available_rooms"]}");

                                      widget.roomController.leftRooms.value =
                                          data["available_rooms"];
                                      widget.roomController.price.value =
                                          data["price"];
                                      widget.roomController
                                          .calculateTotalPrice();
                                      if (widget
                                              .roomController.leftRooms.value >
                                          0) {
                                        widget.roomController.isDateAvailable
                                            .value = true;
                                        showAlertDialog(context, "Available",
                                            "Available", "0k", () {});
                                      } else {
                                        widget.roomController.isDateAvailable
                                            .value = false;
                                        showAlertDialog(context, "No Available",
                                            "No Available", "0k", () {});
                                      }
                                    } else {
                                      debugPrint(
                                          'Document does not exist on the database');
                                    }
                                  });
                                }
                              }
                            })),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget totalPriceWidget() {
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kDivider(),
          CustomText(
              text: "${widget.roomController.totalPrice.value}",
              textStyle: kTextStyleCustom(18, Colors.black)),
          kVerticalSpace(5),
          CustomText(
              text: "for ${widget.roomController.nightStay.value} nights",
              textStyle: kTextStyleCustom(12, Colors.black)),
          kVerticalSpace(5),
          CustomText(
              text: "${widget.roomController.price.value} per night",
              textStyle: kTextStyleCustom(12, Colors.black)),
        ],
      ),
    );
  }
}
