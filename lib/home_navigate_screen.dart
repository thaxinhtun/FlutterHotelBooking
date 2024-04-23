import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_akimomi/nav/home_screen/home_screen.dart';
import 'package:hotel_akimomi/nav/profile_screen/profile.dart';
import 'package:hotel_akimomi/nav/rooms_screen/rooms_screen.dart';
import 'package:hotel_akimomi/util/style.dart';

import 'common/tab_item.dart';
import 'controller/theme_controller.dart';
import 'nav/booking_screen/booking_screen.dart';

class HomeScreen extends StatefulWidget {
  final int selectedIndex;
  const HomeScreen({super.key, required this.selectedIndex});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  final ChangeThemeController _themeController =
      Get.find<ChangeThemeController>();

  String email = "";
  late List<TabItem> tabs;
  static int selectedIndex = 0;

  @override
  void initState() {
    selectedIndex = widget.selectedIndex;

    tabs = [
      TabItem(page: const BodyScreen()),
      TabItem(page: const RoomScreen()),
      TabItem(page: const BookingScreen()),
      TabItem(page: const Setting()),
    ];
    tabs.asMap().forEach((index, details) {
      details.setIndex(index);
    });
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // homeController.onInit();
      // init();
      // initService.setContext(context);
    });

    // Add the observer.
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await tabs[selectedIndex].key.currentState!.maybePop();
        if (isFirstRouteInCurrentTab) {
          if (selectedIndex != 0) {
            _selectTab(0);
            return false;
          }
        }
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        key: _key,
        body: IndexedStack(
          index: selectedIndex,
          children: tabs.map((e) => e.page).toList(),
        ),
        bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: context.theme.colorScheme.secondary,
              boxShadow: [
                BoxShadow(
                  color: greyColor.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                )
              ],
            ),
            child: SafeArea(
              child: BottomNavigationBar(
                  backgroundColor: Colors.transparent,
                  type: BottomNavigationBarType.fixed,
                  currentIndex: selectedIndex,
                  elevation: 0,
                  showSelectedLabels: true,
                  showUnselectedLabels: true,
                  selectedItemColor: deepPurple,
                  unselectedItemColor: backButtonColor,
                  unselectedLabelStyle: const TextStyle(fontSize: 14),
                  selectedLabelStyle: const TextStyle(fontSize: 12),
                  items: [
                    BottomNavigationBarItem(
                        icon: Opacity(
                          opacity: selectedIndex == 0 ? 1 : 0.5,
                          child: Padding(
                              padding: const EdgeInsets.only(bottom: 4.0),
                              child: Icon(
                                Icons.home_filled,
                                color: Colors.white,
                                size: selectedIndex == 0 ? 35 : 20,
                              )
                              // SvgPicture.asset(
                              //   _themeController.customTheme.value == 'cl2'
                              //       ? "assets/home_icon/Home.svg"
                              //       : "assets/home_icon/Home_Big.svg",
                              //   height: selectedIndex == 0 ? 35 : 20,
                              // ),
                              ),
                        ),
                        label: 'Home'),
                    BottomNavigationBarItem(
                      label: 'Rooms',
                      icon: Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: Stack(
                          children: [
                            Opacity(
                                opacity: selectedIndex == 1 ? 1 : 0.5,
                                child: Icon(
                                  Icons.room,
                                  color: Colors.white,
                                  size: selectedIndex == 1 ? 35 : 20,
                                )
                                // SvgPicture.asset(
                                //   _themeController.customTheme.value == 'cl2'
                                //       ? "assets/home_icon/Chat.svg"
                                //       : "assets/home_icon/Chat_Big.svg",
                                //   height: selectedIndex == 1 ? 35 : 20,
                                // ),
                                ),
                          ],
                        ),
                      ),
                    ),
                    BottomNavigationBarItem(
                        icon: Opacity(
                          opacity: selectedIndex == 2 ? 1 : 0.5,
                          child: Padding(
                              padding: const EdgeInsets.only(bottom: 4.0),
                              child: Icon(
                                Icons.book,
                                color: Colors.white,
                                size: selectedIndex == 2 ? 35 : 20,
                              )
                              // SvgPicture.asset(
                              //   _themeController.customTheme.value == 'cl2'
                              //       ? "assets/home_icon/Game.svg"
                              //       : "assets/home_icon/Game_Big.svg",
                              //   height: selectedIndex == 2 ? 35 : 20,
                              // ),
                              ),
                        ),
                        label: 'Booking'),
                    BottomNavigationBarItem(
                        icon: Opacity(
                          opacity: selectedIndex == 3 ? 1 : 0.5,
                          child: Padding(
                              padding: const EdgeInsets.only(bottom: 4.0),
                              child: Icon(
                                Icons.person,
                                color: Colors.white,
                                size: selectedIndex == 3 ? 35 : 20,
                              )
                              // SvgPicture.asset(
                              //   _themeController.customTheme.value == 'cl2'
                              //       ? "assets/home_icon/Profile.svg"
                              //       : "assets/home_icon/Profile_Big.svg",
                              //   height: selectedIndex == 3 ? 35 : 20,
                              // ),
                              ),
                        ),
                        label: 'Profile'),
                  ],
                  onTap: _selectTab),
            )),
      ),
    );
  }

  void _selectTab(int index) {
    FocusManager.instance.primaryFocus!.unfocus();
    if (index == selectedIndex) {
      if (mounted) setState(() {});
      tabs[index].key.currentState?.popUntil((route) => route.isFirst);
    } else {
      if (mounted) setState(() => selectedIndex = index);
    }
  }
}
