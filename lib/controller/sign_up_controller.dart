import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hotel_akimomi/home_navigate_screen.dart';
import 'package:hotel_akimomi/service/init_service.dart';
import '../util/widget/show_alert_dialog.dart';

class SignupController extends GetxController {
  bool confirmSeen = true;
  bool passwordSeen = true;
  bool isLoading = false;

  Future<void> signupValidate(BuildContext context, String username,
      String email, String password, String confirmPassword) async {
    if (username.isEmpty) {
      showAlertDialog(context, 'info'.tr, 'Please fill UserName!', 'ok'.tr, () {
        Navigator.pop(context);
      });
    } else if (email.isEmpty) {
      showAlertDialog(context, 'info'.tr, 'Please fill Password!', 'ok'.tr, () {
        Navigator.pop(context);
      });
    } else if (password.isEmpty) {
      showAlertDialog(context, 'info'.tr, 'Please fill Password!', 'ok'.tr, () {
        Navigator.pop(context);
      });
    } else if (password != confirmPassword) {
      showAlertDialog(context, 'info'.tr,
          'Confirm Password must be same with password!', 'ok'.tr, () {
        Navigator.pop(context);
      });
    } else {
      isLoading = true;
      update();
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        var user = value.user;
        initService.savePrefsUserData(user!, context);
        debugPrint("Created Account!");
        addToDatabase(user.uid, email, username);
        Get.to(const HomeScreen(
          selectedIndex: 0,
        ));
      }).onError((error, stackTrace) {
        debugPrint(
            "Error SignUp with email & password ===> ${error.toString()}");
      });
      isLoading = false;
      update();
    }
  }

  Future<void> addToDatabase(String uid, String email, String name) async {
    await FirebaseFirestore.instance.collection("users").add({
      "uid": uid,
      "email": email,
      "name": name,
      "gender": "",
      "fullname": "",
      "dob": '',
      "phno": '',
      "cardNo": "",
      "cardCode": '',
      "cardExpire": '',
      "nameOnCard": '',
      "loginDate": DateTime.now().toString()
    });

    debugPrint("Add to Firebase Database");
  }

  var googleSignInLoading = false.obs;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  Future<void> signInWithGoogle(BuildContext context) async {
    googleSignInLoading.value = true;
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );
        debugPrint(
            "Google SignIn ===> ${googleSignInAccount.email}  ${googleSignInAccount.displayName}");
        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) {
          var user = value.user;
          initService.savePrefsUserData(user!, context);
          addToDatabase(user.uid, googleSignInAccount.email,
              googleSignInAccount.displayName ?? "");
        });
        Get.off(() => const HomeScreen(selectedIndex: 0));
        googleSignInLoading.value = false;
      }
    } catch (e) {
      debugPrint("Sign in with google error ===> $e");
    }
  }
}
