import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:hotel_akimomi/controller/home_conroller.dart';
import 'package:hotel_akimomi/controller/payment_controller.dart';
import 'package:hotel_akimomi/controller/room_controller.dart';

class BookingController extends GetxController {
  final HomeController homeController = Get.put(HomeController());
  final RoomController roomController = Get.put(RoomController());
  final PaymentController paymentController = Get.put(PaymentController());

  Future<void> bookRooms() async {
    roomController.calculateTotalPrice();
    await FirebaseFirestore.instance.collection("booking").add({
      "uid": FirebaseAuth.instance.currentUser!.uid,
      "book_date": DateTime.now().toString(),
      "check_in": roomController.checkInDate.value.toString(),
      "check_out": roomController.checkOutDate.value.toString(),
      "room_type": roomController.choseRoomType.value,
      "total_people": roomController.sleeps.value,
      "payment": roomController.totalPrice.value,
      "night": roomController.nightStay.value,
    });

    await FirebaseFirestore.instance
        .collection("rooms")
        .where("room_type", isEqualTo: roomController.choseRoomType.value)
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.first.reference.update({
        "available_rooms": roomController.leftRooms.value - 1,
      });
    });
    FirebaseFirestore.instance
        .collection('users')
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.first.reference.update({
        "cardNo": paymentController.cardNoController.text,
        "nameOnCard": paymentController.cardNameController.text,
        "cardCode": paymentController.cvvController.text,
        "cardExpire": paymentController.cardExpireController.text,
      });
    });
  }
}
