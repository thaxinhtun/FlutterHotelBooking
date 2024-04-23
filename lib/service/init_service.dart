import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:hotel_akimomi/util/style.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../util/constant.dart';

class InitService {
  InitService._();
  late SharedPreferences preferences;
  String? userId;
  String? loginDate;
  String? deviceId;
  String? deviceName;
  String? firebaseToken;

  String get getUserId => userId ?? "0";
  SharedPreferences get sharedPreferences => preferences;

  Future<void> savePrefsUserData(User userData, BuildContext context) async {
    preferences.setString(mUserId, userData.uid);
    preferences.setString(userName, userData.displayName ?? "");
    preferences.setString(email, userData.email ?? '');
    preferences.setBool(isLoginPref, true);
    // preferences.setBool(showUserGuide, true);
    loginDate = dayMonthNumberYearFormat.format(DateTime.now());
    preferences.setString(currentDate, loginDate ?? '');
    // await setUserId(context);
    // setToken();
    // setDeviceId();
    // setDeviceName();
    // setUpFirebaseToken();
  }

  // Future<void> setDeviceId() async {
  //   try {
  //     deviceId = (await PlatformDeviceId.getDeviceId)!;
  //     debugPrint("Device Id ===> $deviceId");
  //   } catch (e) {
  //     debugPrint(e.toString());
  //   }
  //   preferences.setString(mDeviceId, deviceId.toString());
  // }

  // Future<void> setDeviceName() async {
  //   DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  //   if (Platform.isAndroid) {
  //     AndroidDeviceInfo androidDeviceInfo = await deviceInfoPlugin.androidInfo;
  //     deviceName = androidDeviceInfo.model;
  //     // deviceId = androidDeviceInfo.id;
  //     //  debugPrint("Device Id ===> $deviceId");
  //   } else if (Platform.isIOS) {
  //     IosDeviceInfo iosDeviceInfo = await deviceInfoPlugin.iosInfo;
  //     deviceName = iosDeviceInfo.utsname.machine;
  //     // deviceId = iosDeviceInfo.identifierForVendor;
  //     //  debugPrint("Device Id ===> $deviceId");
  //   }
  //   preferences.setString(mDeviceName, deviceName ?? '');
  // }

  // Future<void> setUpFirebaseToken() async {
  //   FirebaseMessaging.instance.getToken().then((token) {
  //     firebaseToken = token ?? '';
  //     debugPrint('firebase token======> $firebaseToken');
  //   });
  //   FirebaseMessaging.instance.onTokenRefresh.listen((String token) {
  //     firebaseToken = token;
  //   });
  // }
  Future<void> setUserId() async {
    userId = preferences.getString(mUserId);
    if (userId != null) {
      debugPrint("User Id ===> $userId");
    }
  }

  Future<void> initializeData() async {
    preferences = await SharedPreferences.getInstance();
    await setUserId();

    // await isVpnActive();
    // setFontSize();
    // setToken();
    // setDeviceId();
    // setDeviceName();
    // setUpFirebaseToken();
    // setUpIsLogin();
    // tz.initializeTimeZones();
    // currentTimeZone = await FlutterNativeTimezone.getLocalTimezone();
    // if (currentTimeZone == 'Asia/Yangon') {
    //   currentTimeZone = 'Asia/Rangoon';
    // }
  }
}

InitService initService = InitService._();
