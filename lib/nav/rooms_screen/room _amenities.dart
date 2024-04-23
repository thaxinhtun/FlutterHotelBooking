import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_akimomi/nav/rooms_screen/rooms_screen.dart';

import '../../controller/room_controller.dart';
import '../../util/constant.dart';
import '../../util/widget/custom_text.dart';

class RoomAmenities extends StatelessWidget {
  final RoomController controller;
  const RoomAmenities({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: 'Rooms Information',
          textStyle: kTextStyleCustom(16, context.theme.colorScheme.onPrimary),
        ),
        elevation: 0,
        backgroundColor: context.theme.colorScheme.surface,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.arrow_back_ios)),
      ),
      body: Column(
        children: [
          kVerticalSpace(20),
          CustomText(
            text: "Room amenities",
            textStyle: kTextStyleCustom(16, Colors.black),
            isAlignCenter: false,
          ),
          kVerticalSpace(20),
          Column(
            children: [
              Row(
                children: [
                  kHorizontalSpace(10),
                  const Icon(Icons.wheelchair_pickup),
                  kHorizontalSpace(8),
                  CustomText(
                      text: "Accessibility",
                      textStyle: kTextStyleCustom(14, Colors.black))
                ],
              ),
              kVerticalSpace(8),
              Row(
                children: [
                  kHorizontalSpace(30),
                  Icon(Icons.check),
                  kHorizontalSpace(8),
                  CustomText(
                      text: "Wheelchair accessible",
                      textStyle: kTextStyleCustom(14, Colors.black))
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
