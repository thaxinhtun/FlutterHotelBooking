import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_akimomi/auth/login_screen.dart';
import 'package:hotel_akimomi/model/user.dart';

import '../util/constant.dart';

class SettingController extends GetxController {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  var profile = TBLUser().obs;
  var isMale = true.obs;
  var dayValue = '1'.obs;
  var monthValue = 'January'.obs;
  var yearValue = '1960'.obs;
  var profileSaveLoading = false.obs;
  var imgUrl = ''.obs;
  var totalUsers = 0.obs;
  var totalRooms = 0.obs;
  var totalBooking = 0.obs;
  var totalPayment = 0.obs;

  Future<void> initProfileData() async {
    fullNameController.text = profile.value.fullName ?? '';

    userNameController.text = profile.value.name ?? '';

    phoneNoController.text = profile.value.phno ?? '';
    emailController.text = profile.value.email ?? '';
    isMale.value = (profile.value.gender ?? 'male') == 'male' ? true : false;

    if (profile.value.dob != null) {
      DateTime bd = DateTime.parse(profile.value.dob ?? "");
      dayValue.value = bd.day.toString();
      yearValue.value = bd.year.toString();
    }
    imgUrl.value = profile.value.image ?? "";
  }

  Future<void> disposeProfileData() async {
    profileSaveLoading.value = false;
  }

  @override
  void onClose() {
    // timer.cancel();
    userNameController.dispose();
    fullNameController.dispose();
    passwordController.dispose();
    phoneNoController.dispose();
    emailController.dispose();
    super.onClose();
  }

  Future<void> getUserProfile() async {
    debugPrint(
        "Current user id ===> ${FirebaseAuth.instance.currentUser!.uid}");
    await FirebaseFirestore.instance
        .collection('users')
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((QuerySnapshot querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) {
        debugPrint('Document data: ${querySnapshot.docs[0].data()}');
        Map<String, dynamic> data =
            querySnapshot.docs[0].data() as Map<String, dynamic>? ?? {};
        debugPrint("Data ===> ${data["name"]}");
        TBLUser userData = TBLUser.fromMap(data);
        profile.value = userData;
        debugPrint("Profile Data ===> ${profile.value.name}");
      } else {
        debugPrint('Document does not exist on the database');
      }
    });
  }

  updateProfileLoading(bool value) {
    profileSaveLoading.value = value;
  }

  Future<void> saveProfile(BuildContext context) async {
    try {
      updateProfileLoading(true);
      // if (profile.value.password == '') {
      //   userProfile.value.password = passwordController.text;
      // } else {
      //   userProfile.value.password = '';
      // }
      if (phoneNoController.text == '') {
        if (phoneNoController.text.startsWith("+95")) {
          profile.value.phno = phoneNoController.text;
        } else {
          profile.value.phno = "+95" + phoneNoController.text;
        }
      } else {
        phoneNoController.text = '';
      }

      var inputDate = dayMonthNameYearFormat.parse(
          '${dayValue.value}-${monthValue.value}-${yearValue.value}'); // // <-- dd-LLLL-yyyy (full month name)
      var outputDate = yearMonthDateFormat
          .format(inputDate); // <-- dd-MM-yyyy (month number)
      profile.value.id = FirebaseAuth.instance.currentUser!.uid;
      profile.value.name = userNameController.text;
      profile.value.fullName = fullNameController.text;
      profile.value.email = emailController.text;
      profile.value.dob = outputDate;
      profile.value.gender = isMale.value == true ? "male" : "female";
      profile.value.image = imgUrl.value;
      // userProfile.value.isParent = (isParent.value == true) ? 1 : 0;
      // userProfile.value.isPregnent = (isPregnent.value == true) ? 1 : 0;
      FirebaseFirestore.instance
          .collection('users')
          .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.first.reference.update({
          "fullname": fullNameController.text,
          "phno": phoneNoController.text,
          "gender": profile.value.gender,
          "dob": profile.value.dob,
          "image": imgUrl.value
        });
      });
      updateProfileLoading(false);
      Get.back();
    } catch (e) {
      debugPrint(e.toString());
      updateProfileLoading(false);
    }
  }

  void phoneVerify(String phone) async {
    // addPhoneLoading.value = true;
    phoneNoController.text = phone;

    FirebaseFirestore.instance
        .collection('users')
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.first.reference.update({
        "phno": phone,
      });
    });
    profile.value.phno = phone;
    Get.back();
  }

  Future<void> changePassword(String email, String newPassword) async {
    try {
      // var cred = EmailAuthProvider.credential(email: email, password: "thazin");
      // await FirebaseAuth.instance.currentUser!
      //     .reauthenticateWithCredential(cred)
      //     .then((value) {
      FirebaseAuth.instance.currentUser!.updatePassword(newPassword);
      FirebaseAuth.instance.signOut();
      Get.off(() => const LoginScreen());
      // });
    } catch (e) {
      // Handle reauthentication errors and password change errors.
      debugPrint('Error changing password: $e');
    }
  }
}
