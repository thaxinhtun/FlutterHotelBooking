import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hotel_akimomi/service/app_theme_service.dart';
import 'package:hotel_akimomi/service/translation_service.dart';
import 'package:hotel_akimomi/splash_screen.dart';

import 'controller/language_controller.dart';
import 'controller/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  await ScreenUtil.ensureScreenSize();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          builder: ((context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaleFactor: 1.0,
              ), //set desired text scale factor here
              child: child!,
            );
          }),
          // routes: {
          //   //For Deep Link
          //   '/profile': (BuildContext context) =>
          //       const HomeScreen(selectedIndex: 3, isDeepLink: true)
          // },
          locale: AppTranslations.locale,
          fallbackLocale: AppTranslations.fallbackLocale,
          debugShowCheckedModeBanner: false,
          translations: AppTranslations(),
          // theme: Themes.c1,
          // darkTheme: Themes.dark,
          title: 'Chit May May',
          themeMode: ThemeMode.light,
          theme: Themes.c1,
          darkTheme: Themes.dark,
          home: const SplashScreen(),
          initialBinding: InitialBinding(),
        );
      }));
}

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ChangeThemeController(), permanent: true);
    Get.put(LanguageController(), permanent: true);
    // Get.put(BodyController(), permanent: true);
  }
}
