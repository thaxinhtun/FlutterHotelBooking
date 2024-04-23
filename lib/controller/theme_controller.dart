import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../service/app_theme_service.dart';
import '../util/style.dart';

class ChangeThemeController extends GetxController {
  final customTheme = 'cl1'.obs;
  final customFontSize = 14.0.obs;

  final Map<String, dynamic> options = {
    'cl1': {'name': 'cl1', 'themeData': Themes.c1},
    'cl2': {'name': 'cl2', 'themeData': Themes.c2},
    'dark': {'name': 'dark', 'themeData': Themes.dark},
  };

  @override
  void onInit() {
    initTheme();
    super.onInit();
  }

  Future<void> initTheme() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getString(theme) != null) {
      if (pref.getString(theme) == 'cl1') {
        updateLocale("cl1");
        customTheme.value = 'cl1';
      } else if (pref.getString(theme) == 'cl2') {
        updateLocale("cl2");
        customTheme.value = 'cl2';
      } else {
        updateLocale("dark");
        customTheme.value = 'dark';
      }
    } else {
      updateLocale("cl1");
      customTheme.value = 'cl1';
    }
  }

  // Future<void> changeFontSize(double fontSize) async {
  //   initService.saveFontSize(fontSize);
  //   initService.setFontSize();
  // }

  Future<void> updateLocale(String key) async {
    final ThemeData themeData = options[key]['themeData'];
    // Update App
    Get.changeTheme(themeData);
    customTheme.value = key;
    // save
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(theme, key);
  }
}
