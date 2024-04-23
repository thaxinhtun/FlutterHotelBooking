import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hotel_akimomi/screen/admin_screen/add_roomtype.dart';
import 'package:hotel_akimomi/util/constant.dart';
import 'package:hotel_akimomi/util/widget/custom_loading.dart';
import 'package:hotel_akimomi/util/widget/custom_text.dart';

import '../../controller/room_controller.dart';

class RoomModifyScreen extends StatefulWidget {
  const RoomModifyScreen({super.key});

  @override
  State<RoomModifyScreen> createState() => _RoomModifyScreenState();
}

class _RoomModifyScreenState extends State<RoomModifyScreen> {
  final collection = FirebaseFirestore.instance.collection("rooms");
  final RoomController controller = Get.put(RoomController());
  late Stream<QuerySnapshot> _stream;
  @override
  void initState() {
    _stream = collection.snapshots();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Rooms",
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.indigo,
        iconTheme: const IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => const AddRoomType(
                      roomType: '',
                    ));
              },
              icon: const Icon(Icons.add_outlined))
        ],
      ),
      body: SafeArea(
          child: StreamBuilder<QuerySnapshot>(
        stream: _stream,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("Data Error"),
            );
          }
          if (snapshot.hasData) {
            QuerySnapshot querySnapshot = snapshot.data;
            List<QueryDocumentSnapshot> document = querySnapshot.docs;
            List<Map> items = document.map((e) => e.data() as Map).toList();
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                Map item = items[index];
                return Padding(
                    padding: const EdgeInsets.all(20),
                    child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 7,
                        shadowColor: Colors.grey,
                        color: const Color(0xFFFFFFFF),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                      text: item["room_type"],
                                      textStyle:
                                          kTextStyleCustom(16, Colors.black)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            Get.to(() => AddRoomType(
                                                  roomType: item["room_type"],
                                                ));
                                          },
                                          icon: const Icon(Icons.edit)),
                                      kHorizontalSpace(2),
                                      IconButton(
                                          onPressed: () {
                                            controller.deleteRoomData(
                                                item["room_type"]);
                                          },
                                          icon: const Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ))
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10, top: 10),
                              child: CustomText(
                                  text: "Total Rooms - ${item["total_rooms"]}",
                                  textStyle:
                                      kTextStyleCustom(14, Colors.black)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10, top: 20),
                              child: CustomText(
                                  text: "Price Per Night - ${item["price"]} Ks",
                                  textStyle:
                                      kTextStyleCustom(14, Colors.black)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10, top: 20),
                              child: CustomText(
                                  text: item["available_rooms"] == 0
                                      ? "Sold Out"
                                      : "Only ${item["available_rooms"]} rooms left",
                                  textStyle: kTextStyleCustom(14, Colors.red)),
                            ),
                            kVerticalSpace(15)
                          ],
                        )));
              },
            );
          }
          return const CustomLoading();
        },
      )),
    );
  }
}
