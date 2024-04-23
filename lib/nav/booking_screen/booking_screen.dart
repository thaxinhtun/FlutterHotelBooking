import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hotel_akimomi/util/constant.dart';
import 'package:hotel_akimomi/util/widget/custom_text.dart';

import '../../util/widget/custom_booking_row.dart';
import 'package:dotted_line/dotted_line.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;
  final List<Tab> tabs = [
    const Tab(
      text: "Active",
    ),
    const Tab(
      text: "Past",
    )
  ];

  final List<Widget> tabViews = [activeBookingWidget(), pastBookingWidget()];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: const Text(
            'Booking',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          centerTitle: true,
          backgroundColor: Colors.indigo,
          elevation: 0,
          leading: Container()),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(children: [
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  TabBar(
                    tabs: tabs,
                    controller: tabController,
                    labelColor: Colors.indigo,
                    indicatorColor: Colors.indigo,
                  )
                ],
              )),
          Expanded(
              flex: 10,
              child: TabBarView(
                controller: tabController,
                children: tabViews,
              )),
        ]),
      )),
    );
  }
}

Widget activeBookingWidget() {
  return SingleChildScrollView(
    child: SizedBox(
      height: 200,
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 7,
          shadowColor: Colors.grey,
          color: const Color(0xFFFFFFFF),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kVerticalSpace(20),
                CustomText(
                    text: "Booking on 1 Jun 2021",
                    textStyle: kTextStyleCustom(14, Colors.black)),
                kVerticalSpace(20),
                const DottedLine(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.center,
                  lineLength: double.infinity,
                  lineThickness: 1.0,
                  dashLength: 4.0,
                  dashColor: Colors.black,
                  dashRadius: 0.0,
                  dashGapLength: 4.0,
                  dashGapColor: Colors.transparent,
                  dashGapRadius: 0.0,
                ),
                kVerticalSpace(20),
                const CustomRowBooking(
                  text: "Check-in",
                  text2: "Room type",
                  fontSize: 12,
                  textColor: Colors.grey,
                ),
                kVerticalSpace(3),
                const CustomRowBooking(
                  text: "3 Jun 2021",
                  text2: "Deluxe Room",
                  fontSize: 14,
                  textColor: Colors.black,
                ),
                kVerticalSpace(15),
                const CustomRowBooking(
                  text: "Check-out",
                  text2: "Capacity",
                  fontSize: 12,
                  textColor: Colors.grey,
                ),
                kVerticalSpace(3),
                const CustomRowBooking(
                  text: "9 Jun 2021",
                  text2: "Double Bed",
                  fontSize: 14,
                  textColor: Colors.black,
                ),
                kVerticalSpace(20)
              ],
            ),
          )

          // CustomText(
          //   text: title,
          //   textStyle: kTextStyleCustom(16, context.theme.focusColor),
          // ),

          ),
    ),
  );
}

Widget pastBookingWidget() {
  return const Center(
    child: Text("Past"),
  );
}
