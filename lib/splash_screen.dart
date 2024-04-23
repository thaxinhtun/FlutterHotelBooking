import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_akimomi/auth/launch_screen.dart';
import 'package:hotel_akimomi/auth/sign_up_screen.dart';
import 'package:hotel_akimomi/home_navigate_screen.dart';
import 'package:hotel_akimomi/service/init_service.dart';
import 'package:hotel_akimomi/util/constant.dart';
import 'package:hotel_akimomi/util/widget/custom_loading.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    init();

    super.initState();
  }

  void init() async {
    await initService.initializeData();
    debugPrint("Get User Id ===> ${initService.getUserId}");
    Future.delayed(const Duration(seconds: 3), () {
      if (initService.getUserId == "0") {
        Get.to(const LaunchScreen());
      } else {
        Get.to(const HomeScreen(
          selectedIndex: 0,
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.secondary,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Hotel Akimomi",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
          ),
          kHorizontalSpace(15),
          const CustomLoading(
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
