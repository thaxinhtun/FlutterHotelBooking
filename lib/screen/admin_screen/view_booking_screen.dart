import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../util/widget/custom_booking_row.dart';

class ViewBookingScreen extends StatefulWidget {
  const ViewBookingScreen({super.key});

  @override
  State<ViewBookingScreen> createState() => _ViewBookingScreenState();
}

class _ViewBookingScreenState extends State<ViewBookingScreen>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;
  final List<Tab> tabs = [
    const Tab(
      text: "Today",
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
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () => Get.back(),
        ),
      ),
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
      height: 300,
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 7,
          shadowColor: Colors.grey,
          color: const Color(0xFFFFFFFF),
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      child: Icon(Icons.person),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text("Name"),
                  ],
                ),
                Text("Booking on 1 Jun 2021"),
                SizedBox(height: 10),
                CustomRowBooking(
                  text: "Check-in",
                  text2: "Room type",
                  fontSize: 12,
                  textColor: Colors.grey,
                ),
                SizedBox(height: 3),
                CustomRowBooking(
                  text: "3 Jun 2021",
                  text2: "Deluxe Room",
                  fontSize: 14,
                  textColor: Colors.black,
                ),
                SizedBox(height: 15),
                CustomRowBooking(
                  text: "Check-out",
                  text2: "Capacity",
                  fontSize: 12,
                  textColor: Colors.grey,
                ),
                SizedBox(height: 3),
                CustomRowBooking(
                  text: "9 Jun 2021",
                  text2: "Double Bed",
                  fontSize: 14,
                  textColor: Colors.black,
                ),
                SizedBox(height: 20),
                Text("Total Guests - 3"),
                SizedBox(height: 10),
                Text("Total Payment - 30000 Ks"),
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
