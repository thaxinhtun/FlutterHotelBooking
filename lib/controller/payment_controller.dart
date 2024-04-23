import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_akimomi/controller/setting_controller.dart';
import 'package:hotel_akimomi/model/user.dart';

import '../util/widget/show_alert_dialog.dart';

class PaymentController extends GetxController {
  TextEditingController cardNoController = TextEditingController();
  TextEditingController cardNameController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController cardExpireController = TextEditingController();
  SettingController settingController = Get.put(SettingController());

  Future<void> initCardData() async {
    cardNoController.text = settingController.profile.value.cardno ?? '';
    // urlImageEncode.value = profile.value.image ?? "";
    cardNameController.text = settingController.profile.value.nameOncard ?? '';
    // passwordController.text =
    //     (userProfile.value.password == '') ? '' : '12345678';
    cvvController.text = settingController.profile.value.cardcode ?? '';
    cardExpireController.text =
        settingController.profile.value.cardExpire ?? '';
    // isMale.value =
    //     (profile.value.gender ?? 'male') == 'male' ? true : false;

    // if (userProfile.value.dob != null) {
    //   DateTime bd = DateTime.parse(userProfile.value.dob ?? "");
    //   dayValue.value = bd.day.toString();
    //   yearValue.value = bd.year.toString();
    // }
  }

  Future<void> validateField(BuildContext context, String cardNo, String name,
      String cvv, String expire) async {
    if (cardNo.isEmpty) {
      debugPrint('cardNo is Empty');
      showAlertDialog(context, 'info'.tr, 'Please fill Card No!', 'ok'.tr, () {
        Navigator.pop(context);
      });
    } else if (name.isEmpty) {
      debugPrint('name is Empty');
      showAlertDialog(context, 'info'.tr, 'Please fill Name on Card!', 'ok'.tr,
          () {
        Navigator.pop(context);
      });
    } else if (cvv.isEmpty) {
      debugPrint('cvv is Empty');
      showAlertDialog(context, 'info'.tr, 'Please fill CVV!', 'ok'.tr, () {
        Navigator.pop(context);
      });
    } else if (expire.isEmpty) {
      debugPrint('expire is Empty');
      showAlertDialog(context, 'info'.tr, 'Please fill Expire Date!', 'ok'.tr,
          () {
        Navigator.pop(context);
      });
    } else if (cvv.length < 3) {
      debugPrint('cvv length is incorrect');
      showAlertDialog(context, 'info'.tr, 'CVV format is not correct!', 'ok'.tr,
          () {
        Navigator.pop(context);
      });
    } else if (expire.length < 5) {
      debugPrint('expire length is incorrect');
      showAlertDialog(context, 'info'.tr, 'Expire Date Format wrong!', 'ok'.tr,
          () {
        Navigator.pop(context);
      });
    } else {
      FirebaseFirestore.instance
          .collection('users')
          .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.first.reference.update({
          "cardNo": cardNoController.text,
          "nameOnCard": cardNameController.text,
          "cardCode": cvvController.text,
          "cardExpire": cardExpireController.text,
        });
        debugPrint("Add Payment Card to Firebase Database");

        settingController.profile.value.cardno = cardNoController.text;
        settingController.profile.value.nameOncard = cardNameController.text;
        settingController.profile.value.cardno = cvvController.text;
        settingController.profile.value.cardExpire = cardExpireController.text;
        showAlertDialog(context, 'info'.tr,
            'Save Payment credit Card successfully ', 'ok'.tr, () {
          Navigator.pop(context);
        });
      });
    }
  }
}
