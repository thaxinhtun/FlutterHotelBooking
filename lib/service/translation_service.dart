import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../language/en_us.dart';
import '../language/mm_uni.dart';

class AppTranslations extends Translations {
  // Default locale
  static const locale = Locale('en', 'US');

  // fallbackLocale saves the day when the locale gets in trouble
  static const fallbackLocale = Locale('mm', 'Uni');

  // Supported languages
  // Needs to be same order with locales
  static final langs = [
    'English',
    'Myanmar',
  ];

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'mm_Uni': mmUni,
      };
}
