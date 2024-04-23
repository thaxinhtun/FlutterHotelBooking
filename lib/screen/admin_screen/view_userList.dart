import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_akimomi/util/constant.dart';

import '../../util/widget/custom_loading.dart';
import '../../util/widget/custom_userList.dart';

class ViewUserList extends StatefulWidget {
  const ViewUserList({super.key});

  @override
  State<ViewUserList> createState() => _ViewUserListState();
}

class _ViewUserListState extends State<ViewUserList> {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection("users");
  late Stream<QuerySnapshot> _stream;

  @override
  void initState() {
    _stream = collection.snapshots();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "All Registered Users",
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
      ),
      body: SafeArea(
          child: StreamBuilder<QuerySnapshot>(
              stream: _stream,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return const CustomLoading();
                }
                if (snapshot.hasData) {
                  QuerySnapshot querySnapshot = snapshot.data;
                  List<QueryDocumentSnapshot> document = querySnapshot.docs;
                  List<Map> items =
                      document.map((e) => e.data() as Map).toList();
                  return ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (BuildContext context, int index) {
                      Map item = items[index];
                      return Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          // rows of payment list
                          children: [
                            CustomUserList(
                              icon: Icons.person,
                              name: item["fullname"] != ""
                                  ? item["fullname"]
                                  : item["name"],
                              email: item["email"],
                              loginDate: item["loginDate"],
                              img: item["image"] ?? "",
                            ),
                            kVerticalSpace(10),
                            kDivider(),
                            kVerticalSpace(10)
                          ],
                        ),
                      );
                    },
                  );
                }
                return const CustomLoading();
              })),
    );
  }
}
