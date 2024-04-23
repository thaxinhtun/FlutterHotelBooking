import 'package:flutter/material.dart';

class Themes {
  static final c1 = ThemeData.light().copyWith(
    primaryColor: Colors.indigo[700],
    scaffoldBackgroundColor: const Color(0xFFF7F7F7),
    primaryColorLight: Colors.white,
    primaryColorDark: const Color(0xFF4E4E4E),
    dividerColor: const Color(0xFF000000),
    focusColor: Colors.indigo[500],
    unselectedWidgetColor: const Color(0xFF606060),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      background: const Color(0xFFFFFFFF),
      secondary: Colors.indigo[800],
      primary: const Color(0xFF000000),
      onPrimary: const Color(0xFFFFFFFF),
      outline: const Color(0xFFFFFFFF),
      primaryContainer: Colors.indigo[700],
      onPrimaryContainer: Colors.indigo[500],
      error: const Color(0xFFE61E1E),
      surface: Colors.indigo[700],
      onSurface: const Color(0xFF6C6C6C),
      secondaryContainer: const Color(0xFF82EACA),
      onSecondaryContainer: const Color(0xFF4DA0BE),
      inverseSurface: const Color(0xFFFFFFFF),
      tertiary: const Color(0xFF714FA0),
      shadow: Colors.black12,
      onTertiary: Colors.grey[300],
    ),
  );
  static final c2 = ThemeData.light().copyWith(
    primaryColor: const Color(0xFF4B3174),
    scaffoldBackgroundColor: const Color(0xFFFCF2EA),
    primaryColorLight: const Color(0xFFF1E7E5),
    primaryColorDark: const Color(0xFF4E4E4E),
    dividerColor: const Color(0xFFFFFFFF),
    focusColor: const Color(0xFF714FA0),
    unselectedWidgetColor: const Color(0xFF606060),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      background: const Color(0xFFFFFFFF),
      secondary: const Color(0xFF4B3174),
      primary: const Color(0xFF000000),
      onPrimary: const Color(0xFFFFFFFF),
      outline: const Color(0xFFFFFFFF),
      primaryContainer: const Color(0xFF82EACA),
      onPrimaryContainer: const Color(0xFF4DA0BE),
      error: const Color(0xFFFFA39B),
      surface: const Color(0xFF4B3174),
      onSurface: const Color(0xFFFFFFFF),
      secondaryContainer: const Color(0xFF82EACA),
      onSecondaryContainer: const Color(0xFF4DA0BE),
      inverseSurface: const Color(0xFFFEE5CF),
      tertiary: const Color(0xFF31D5C8),
      shadow: Colors.black12,
      onTertiary: const Color.fromARGB(255, 247, 235, 225),
    ),
  );
  static final dark = ThemeData.light().copyWith(
    primaryColor: const Color(0xFF714FA0),
    scaffoldBackgroundColor: const Color(0xFF1F1F1F),
    primaryColorLight: const Color(0xFF363636),
    primaryColorDark: const Color(0xFFA8A8A8),
    dividerColor: const Color(0xFF6C6C6C),
    focusColor: const Color(0xFFFFFFFF),
    unselectedWidgetColor: const Color(0xFF606060),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      background: const Color(0xFF0F0F0F),
      secondary: const Color(0xFF0F0F0F),
      primary: const Color(0xFFFFFFFF),
      onPrimary: const Color(0xFFFFFFFF),
      outline: const Color(0xFF0F0F0F),
      primaryContainer: const Color(0xFFBF8BDB),
      onPrimaryContainer: const Color(0xFF9178D3),
      error: const Color(0xFFE61E1E),
      surface: const Color(0xFF1F1F1F),
      onSurface: const Color(0xFF6C6C6C),
      secondaryContainer: const Color(0xFF82EACA),
      onSecondaryContainer: const Color(0xFF4DA0BE),
      inverseSurface: const Color(0xFF0F0F0F),
      tertiary: const Color(0xFF714FA0),
      shadow: const Color(0xFF0F0F0F),
      onTertiary: const Color.fromARGB(255, 45, 45, 45),
    ),
  );
}