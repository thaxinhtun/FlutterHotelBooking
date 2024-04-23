import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_akimomi/controller/room_controller.dart';
import 'package:hotel_akimomi/nav/rooms_screen/room_category.dart';
import 'package:hotel_akimomi/util/widget/custom_loading.dart';

import '../../util/constant.dart';

import '../../util/widget/custom_text.dart';

class RoomScreen extends StatefulWidget {
  const RoomScreen({super.key});

  @override
  State<RoomScreen> createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  final RoomController roomController = Get.put(RoomController());

  List<String> imgs = [];
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('rooms');
  late Stream<QuerySnapshot> _stream;

  @override
  void initState() {
    _stream = _collectionReference.snapshots();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: CustomText(
              text: 'Rooms Options',
              textStyle:
                  kTextStyleCustom(16, context.theme.colorScheme.onPrimary),
            ),
            elevation: 0,
            backgroundColor: context.theme.colorScheme.surface,
            leading: Container()),
        body: StreamBuilder<QuerySnapshot>(
            stream: _stream,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return const CustomLoading();
              }
              if (snapshot.hasData) {
                QuerySnapshot querySnapshot = snapshot.data;
                List<QueryDocumentSnapshot> document = querySnapshot.docs;
                List<Map> items = document.map((e) => e.data() as Map).toList();
                return ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    Map item = items[index];
                    var imgs = <String>[];
                    imgs.add(item["images"][0]);
                    imgs.add(item["images"][1]);
                    imgs.add(item["images"][2]);
                    return RoomCategoryScreen(
                      roomName: item["room_type"],
                      squareFoot: item["square_feet"],
                      sleeps: item["sleeps"],
                      doubleBedRooms: item["double_bed"],
                      twinBedRooms: item["twin_bed"],
                      imageSliders: imgs,
                      roomController: roomController,
                    );
                  },
                );
              }
              return const CustomLoading();
            }));
  }
}
