import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_akimomi/util/constant.dart';
import 'package:hotel_akimomi/util/widget/custom_text.dart';

import '../../util/widget/custom_explore_area.dart';
import '../../util/widget/custome_amenities_circle.dart';
import '../../controller/home_conroller.dart';
import '../../util/widget/custom_button.dart';
import '../../util/widget/home_searchcared_detail.dart';

class BodyScreen extends StatefulWidget {
  const BodyScreen({super.key});

  @override
  State<BodyScreen> createState() => _BodyScreenState();
}

class _BodyScreenState extends State<BodyScreen> {
  final HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: const Text("Hotel Akimomi",
                style: TextStyle(color: Colors.white, fontSize: 16)),
            centerTitle: true,
            backgroundColor: Colors.indigo,
            elevation: 0,
            leading: Container()),
        body: SingleChildScrollView(
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                kVerticalSpace(20),
                Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 7,
                    shadowColor: Colors.grey,
                    color: const Color(0xFFFFFFFF),
                    child: Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        child: Column(
                          children: [
                            kVerticalSpace(20),
                            HomeSearchCardRow(
                              icon: Icons.date_range,
                              text:
                                  "${dayMonthNameYearFormat.format(homeController.startDate.value)} - ${dayMonthNameYearFormat.format(homeController.endDate.value)}",
                              onTap: () async {
                                DateTimeRange selectedDates = DateTimeRange(
                                    start: DateTime.now(), end: DateTime.now());

                                final DateTimeRange? dateTimeRange =
                                    await showDateRangePicker(
                                  context: context,
                                  initialEntryMode:
                                      DatePickerEntryMode.calendarOnly,
                                  firstDate: DateTime(2024,
                                      DateTime.now().month, DateTime.now().day),
                                  lastDate: DateTime(2025),
                                  useRootNavigator: true,
                                );
                                if (dateTimeRange != null) {
                                  debugPrint(
                                      "Start Date ===> ${dateTimeRange.start}");
                                  debugPrint(
                                      "End Date ===> ${dateTimeRange.end}");
                                  homeController.startDate.value =
                                      dateTimeRange.start;
                                  homeController.endDate.value =
                                      dateTimeRange.end;
                                } else {
                                  debugPrint("Date Range is null ");
                                }
                              },
                            ),
                            kVerticalSpace(10),
                            kDivider(),
                            kVerticalSpace(10),
                            HomeSearchCardRow(
                              icon: Icons.person_2_outlined,
                              text:
                                  "${homeController.roomCount.value} rooms . ${homeController.adultCount.value} adults ",
                              onTap: () {
                                debugPrint("select rooms");
                                showRoomAndAdults(context, homeController);
                              },
                            ),
                            kVerticalSpace(10),
                            kDivider(),
                            kVerticalSpace(10),
                            const Text(
                              "Search",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.indigo,
                                  fontWeight: FontWeight.bold),
                            ),
                            kVerticalSpace(20),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ))

                    // CustomText(
                    //   text: title,
                    //   textStyle: kTextStyleCustom(16, context.theme.focusColor),
                    // ),

                    ),
                //Categories Section
                kVerticalSpace(30),
                CustomText(
                  text: "Our Popular amenities",
                  textStyle: kTextStyleCustom(16, Colors.black),
                ),
                kVerticalSpace(20),

                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      //section 1
                      CustomAmenitiesCircle(
                        icon: Icons.wifi,
                        text: "Fee Wifi",
                      ),
                      SizedBox(
                        width: 20,
                      ),

                      CustomAmenitiesCircle(
                        icon: Icons.coffee,
                        text: "Breakfast",
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      CustomAmenitiesCircle(
                        icon: Icons.restaurant,
                        text: "Restaurant",
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      CustomAmenitiesCircle(
                        icon: Icons.room_service,
                        text: "Room Service",
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      CustomAmenitiesCircle(
                        icon: Icons.local_parking,
                        text: "Parking",
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      CustomAmenitiesCircle(
                        icon: Icons.wine_bar,
                        text: "Bar",
                      ),
                    ],
                  ),
                ),
                kVerticalSpace(20),
                //Explore The Area
                kDivider(),
                kVerticalSpace(20),
                CustomText(
                  text: "We are here!",
                  textStyle: kTextStyleCustom(16, Colors.black),
                ),
                CustomText(
                  text:
                      "No 125, Khay Mar Road, 6th Quarter, Pyin Oo Lwin, Mandalay",
                  textStyle: kTextStyleCustom(14, Colors.black),
                ),
                kVerticalSpace(10),
                CustomText(
                  text: "Explore the Area",
                  textStyle: kTextStyleCustom(16, Colors.black),
                ),
                kVerticalSpace(20),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomeExploreArea(
                      icon: Icons.location_on,
                      location: 'Candacraig Hotel',
                      minuute: '17 min',
                      walkOrDrive: 'walk',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomeExploreArea(
                      icon: Icons.location_on,
                      location: 'Pyin Oo Lwin Golf CLub',
                      minuute: '3 min',
                      walkOrDrive: 'drive',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomeExploreArea(
                      icon: Icons.location_on,
                      location: 'National Kandawgyi Gardens',
                      minuute: '4 min',
                      walkOrDrive: 'drive',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomeExploreArea(
                      icon: Icons.local_airport,
                      location: 'mandalay(MDL-Mandalay Intl.)',
                      minuute: '75 min',
                      walkOrDrive: 'drive',
                    ),
                  ],
                ),
              ],
            ),
          )),
        ),
      );
    });
  }
}

Future showRoomAndAdults(BuildContext context, HomeController homeController) {
  return showModalBottomSheet(
    context: context,
    builder: (context) {
      return Obx(() {
        return SizedBox(
          height: 300,
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                const Text(
                  "Select rooms and guests",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                kVerticalSpace(30),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomText(
                          text: "Rooms",
                          textStyle: kTextStyleCustom(16, Colors.black)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                if (homeController.roomCount.value > 1) {
                                  homeController.roomCount.value -= 1;
                                }
                              },
                              icon: const Icon(
                                Icons.remove_outlined,
                                size: 16,
                              )),
                          Text("${homeController.roomCount.value} ",
                              style: const TextStyle(fontSize: 16)),
                          IconButton(
                              onPressed: () {
                                homeController.roomCount.value += 1;
                              },
                              icon: const Icon(
                                Icons.add_outlined,
                                size: 16,
                              )),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomText(
                          text: "Adults",
                          textStyle: kTextStyleCustom(16, Colors.black)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                if (homeController.adultCount.value > 1) {
                                  homeController.adultCount.value -= 1;
                                }
                              },
                              icon: const Icon(
                                Icons.remove_outlined,
                                size: 16,
                              )),
                          Text("${homeController.adultCount.value} ",
                              style: const TextStyle(fontSize: 16)),
                          IconButton(
                              onPressed: () {
                                homeController.adultCount.value += 1;
                              },
                              icon: const Icon(
                                Icons.add_outlined,
                                size: 16,
                              )),
                        ],
                      )
                    ],
                  ),
                ),
                kVerticalSpace(30),
                CustomButton(
                    label: 'Apply',
                    backgroundColor: Colors.indigo,
                    textStyle: kTextStyleWhite(14),
                    onTap: () {
                      Navigator.pop(context);
                    }),
              ],
            ),
          ),
        );
      });
    },
  );
}
