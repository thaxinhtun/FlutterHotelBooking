import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant.dart';
import '../style.dart';
import 'custom_button.dart';

class ConstantUtils {
  static Future<bool> isInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }

  static showAlertDialog(BuildContext context, String message) {
    // Create button
    Widget okButton = CustomButton(
      label: 'ok'.tr,
      backgroundColor: backgroundDarkPurple,
      textStyle: kTextStyleWhite(12),
      onTap: () async {
        Navigator.of(context).pop();
      },
    );
    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text('Warning Message'),
      content: Text(message.tr),
      actions: [
        okButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
