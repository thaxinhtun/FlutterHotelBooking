import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hotel_akimomi/controller/room_controller.dart';
import 'package:hotel_akimomi/controller/setting_controller.dart';
import 'package:hotel_akimomi/util/widget/custom_loading.dart';

import '../../util/widget/custom_avaiilable_avatar.dart';
import '../../util/widget/custom_booking_row.dart';

import '../../util/widget/custom_report_eidget.dart';

import '../drawer.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  final SettingController settingController = Get.put(SettingController());

  @override
  void initState() {
    FirebaseFirestore.instance.collection('users').get().then((querySnapshot) {
      debugPrint('Total documents: ${querySnapshot.size}');
      settingController.totalUsers.value = querySnapshot.size;
    });
    FirebaseFirestore.instance.collection('rooms').get().then((querySnapshot) {
      debugPrint('Total documents: ${querySnapshot.size}');
      settingController.totalRooms.value = querySnapshot.size;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            "Admin DashBoard",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.indigo,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        drawer: const MyDrawer(),
        body: Obx(() {
          return SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomReportWidget(
                          color: Colors.indigo[200],
                          icon: Icons.people,
                          title: '${settingController.totalUsers.value}',
                          totalAmount: 'Total Users',
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        // ignore: prefer_const_constructors
                        CustomReportWidget(
                          color: const Color.fromARGB(255, 236, 209, 184),
                          icon: Icons.room_preferences,
                          title: '${settingController.totalRooms.value}',
                          totalAmount: 'Total Rooms',
                        ),

                        // ignore: prefer_const_constructors
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomReportWidget(
                          color: Color.fromARGB(255, 171, 217, 225),
                          icon: Icons.book,
                          title: '32',
                          totalAmount: 'Total Bookings',
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        // ignore: prefer_const_constructors
                        CustomReportWidget(
                          color: Color.fromARGB(255, 243, 183, 209),
                          icon: Icons.payment,
                          title: '34',
                          totalAmount: 'Total Payment',
                        ),

                        // ignore: prefer_const_constructors
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("Today Activities"),
                    const SizedBox(
                      height: 10,
                    ),
                    const SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          //section 1
                          CustomCircleAvatar(
                            count: 2,
                            text: "Rooms available",
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          CustomCircleAvatar(
                            count: 3,
                            text: "Rooms booked",
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          CustomCircleAvatar(
                            count: 3,
                            text: "Total Guests",
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          CustomCircleAvatar(
                            count: 30000,
                            text: "Total Payment",
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    //Categories Section

                    const Text("Today Bookings"),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 300,
                      child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 7,
                          shadowColor: Colors.grey,
                          color: const Color(0xFFFFFFFF),
                          child: const Padding(
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
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
