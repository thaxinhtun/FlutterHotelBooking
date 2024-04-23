import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../util/widget/show_alert_dialog.dart';

class RoomController extends GetxController {
  var isMoreDetail = false.obs;
  var imgSlider = <String>[].obs;
  var isChooseDate = false.obs;
  var isDateAvailable = false.obs;
  var checkInDate = DateTime.now().obs;
  var checkOutDate = DateTime.now().obs;
  var refunableDate = DateTime.now().obs;
  var leftRooms = 0.obs;
  var totalPrice = 0.obs;
  var price = 0.obs;
  var nightStay = 0.obs;
  var images = <String>[].obs;
  var imagePath1 = File("").obs;
  var imagePath2 = File("").obs;
  var imagePath3 = File("").obs;
  var img1 = "".obs;
  var img2 = "".obs;
  var img3 = "".obs;
  var choseRoomType = ''.obs;
  var sleeps = 0.obs;

  TextEditingController roomTypeController = TextEditingController();
  TextEditingController squareFeetController = TextEditingController();
  TextEditingController totalRoomsController = TextEditingController();
  TextEditingController doubleBedController = TextEditingController();
  TextEditingController tripleBedController = TextEditingController();
  TextEditingController pricePerNightController = TextEditingController();
  TextEditingController sleepsController = TextEditingController();
  TextEditingController bathRoomController = TextEditingController();

  Future<void> calculateTotalPrice() async {
    nightStay.value = checkOutDate.value.difference(checkInDate.value).inDays;
    totalPrice.value = price.value * nightStay.value;
  }

  Future<void> getRoomsData(String roomType) async {
    await FirebaseFirestore.instance
        .collection('rooms')
        .where('room_type', isEqualTo: roomType)
        .get()
        .then((QuerySnapshot querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) {
        debugPrint('Document data: ${querySnapshot.docs[0].data()}');
        Map<String, dynamic> data =
            querySnapshot.docs[0].data() as Map<String, dynamic>? ?? {};
        roomTypeController.text = data["room_type"];
        squareFeetController.text = data["square_feet"].toString();
        totalRoomsController.text = data["total_rooms"].toString();
        doubleBedController.text = data["double_bed"].toString();
        tripleBedController.text = data["twin_bed"].toString();
        pricePerNightController.text = data["price"].toString();
        sleepsController.text = data["sleeps"].toString();
        bathRoomController.text = data["bathrooms"].toString();
        imagePath1.value = File(data["images"][0]);
        imagePath2.value = File(data["images"][1]);
        imagePath3.value = File(data["images"][2]);
        img1.value = data["images"][0];
        img2.value = data["images"][1];
        img3.value = data["images"][2];
      } else {
        debugPrint('Document does not exist on the database');
      }
    });
  }

  Future<void> validateRoomType(BuildContext context) async {
    if (roomTypeController.text.isEmpty) {
      showAlertDialog(context, 'info'.tr, 'Please fill roomType!', 'ok'.tr, () {
        Navigator.pop(context);
      });
    } else if (squareFeetController.text.isEmpty) {
      showAlertDialog(
          context, 'info'.tr, 'Please fill squareFeetController!', 'ok'.tr, () {
        Navigator.pop(context);
      });
    } else if (totalRoomsController.text.isEmpty) {
      showAlertDialog(
          context, 'info'.tr, 'Please fill totalRoomsController!', 'ok'.tr, () {
        Navigator.pop(context);
      });
    } else if (doubleBedController.text.isEmpty) {
      showAlertDialog(
          context, 'info'.tr, 'Please fill doubleBedController!', 'ok'.tr, () {
        Navigator.pop(context);
      });
    } else if (tripleBedController.text.isEmpty) {
      showAlertDialog(
          context, 'info'.tr, 'Please fill tripleBedController!', 'ok'.tr, () {
        Navigator.pop(context);
      });
    } else if (pricePerNightController.text.isEmpty) {
      showAlertDialog(
          context, 'info'.tr, 'Please fill pricePerNightController!', 'ok'.tr,
          () {
        Navigator.pop(context);
      });
    } else if (sleepsController.text.isEmpty) {
      showAlertDialog(
          context, 'info'.tr, 'Please fill sleepsController!', 'ok'.tr, () {
        Navigator.pop(context);
      });
    } else if (bathRoomController.text.isEmpty) {
      showAlertDialog(
          context, 'info'.tr, 'Please fill bathRoomController!', 'ok'.tr, () {
        Navigator.pop(context);
      });
    } else {
      await FirebaseFirestore.instance.collection("rooms").add({
        "bathrooms": int.parse(bathRoomController.text),
        "double_bed": int.parse(doubleBedController.text),
        "price": int.parse(pricePerNightController.text),
        "room_type": roomTypeController.text,
        "sleeps": int.parse(sleepsController.text),
        "square_feet": int.parse(squareFeetController.text),
        "total_rooms": int.parse(totalRoomsController.text),
        "twin_bed": int.parse(tripleBedController.text),
        "available_rooms": int.parse(totalRoomsController.text),
        "images": images.toList(),
      });

      // ignore: use_build_context_synchronously
      showAlertDialog(context, 'info'.tr, 'Successfully add Room Type', 'ok'.tr,
          () {
        Navigator.pop(context);
      });
      debugPrint("Successfully add Room Type");
    }
  }

  Future<void> imageUpload(File img1, File img2, File img3) async {
    imagePath1.value = img1;
    imagePath2.value = img2;
    imagePath3.value = img3;
  }

  Future<void> updateRoomData(String roomtype) async {
    FirebaseFirestore.instance
        .collection('rooms')
        .where('room_type', isEqualTo: roomtype)
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.first.reference.update({
        "room_type": roomTypeController.text,
        "square_feet": int.parse(squareFeetController.text),
        "total_rooms": int.parse(totalRoomsController.text),
        "double_bed": int.parse(doubleBedController.text),
        "twin_bed": int.parse(tripleBedController.text),
        "price": int.parse(pricePerNightController.text),
        "sleeps": int.parse(sleepsController.text),
        "bathrooms": int.parse(bathRoomController.text),
        "images": images.toList()
      });
    });
  }

  Future<void> deleteRoomData(String roomtype) async {
    FirebaseFirestore.instance
        .collection('rooms')
        .where('room_type', isEqualTo: roomtype)
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.first.reference.delete();
    });
  }
}
