import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hotel_akimomi/home_navigate_screen.dart';
import 'package:hotel_akimomi/service/init_service.dart';

import '../screen/admin_screen/admin_screen.dart';
import '../util/widget/show_alert_dialog.dart';

class CommonController extends GetxController {
  bool isLoading = false;
  //Login
  bool passwordSeen = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController forgotPasswordController =
      TextEditingController();

  bool validateField() {
    return (emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty);
  }

  void updateLoading(bool value) {
    isLoading = value;
    update();
  }

  void saveLogin(
    BuildContext context,
  ) async {
    updateLoading(true);
    try {
      FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((value) {
        debugPrint("Login Successfully");
        var user = value.user;
        initService.savePrefsUserData(user!, context);
        emailController.text == "admin@gmail.com" &&
                passwordController.text == "admin123"
            ? Get.to(const AdminHomeScreen())
            : Get.to(const HomeScreen(
                selectedIndex: 0,
              ));
      });

      updateLoading(false);
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        showAlertDialog(context, "info".tr, "User not registered yet!", "Ok",
            () {
          Navigator.pop(context);
        });
      } else if (e.code == "wrong-password") {
        showAlertDialog(context, "info".tr, "Password is not correct", "Ok",
            () {
          Navigator.pop(context);
        });
      }
    }
  }

  Future resetPassword(String email, BuildContext context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      // ignore: use_build_context_synchronously
      showAlertDialog(context, 'Password reset',
          'Password reset link sent! Check your email'.tr, 'ok'.tr, () {
        Navigator.pop(context);
      });
    } catch (e) {
      debugPrint("Reset Password Error");
    }
  }
}
