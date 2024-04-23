// import 'package:chitmaymay/service/init_service.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../util/style.dart';

class LanguageController extends GetxController {
  final isMyanmarLang = false.obs;

  @override
  void onInit() {
    // initLocation();
    updateLocale("en");
    super.onInit();
  }

  final Map<String, dynamic> optionsLocales = {
    'en': {'languageCode': 'en', 'countryCode': 'US', 'description': 'English'},
    'mm': {'languageCode': 'mm', 'countryCode': 'MM', 'description': 'Myanmar'},
  };

  // Future<void> initLocation() async {
  //   Position position = await getGeoLocationPosition();
  //   String countryCode = await getAddressFromLatLong(position);
  //   saveCountryCode(countryCode);
  // }

  Future<void> saveCountryCode(String countryCode) async {
    // initService.setCountryCode(countryCode);
    debugPrint("countrycode====> $countryCode");
    try {
      if (countryCode == 'MM') {
        updateLocale("mm");
        isMyanmarLang.value = true;
      } else {
        updateLocale("en");
        isMyanmarLang.value = false;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // Future<String> getAddressFromLatLong(Position position) async {
  //   try {
  //     List<Placemark> placemarks =
  //         await placemarkFromCoordinates(position.latitude, position.longitude);
  //     Placemark place = placemarks[0];
  //     return place.isoCountryCode.toString();
  //   } catch (e) {
  //     return '';
  //   }
  // }

  // Future<void> getIpAddress() async {
  //   try {
  //     final response = await http.get(Uri.parse('http://ip-api.com/json'));
  //     final data = json.decode(response.body);
  //     final countryCode = data['countryCode'];
  //     debugPrint(countryCode);
  //     saveCountryCode(countryCode);
  //   } catch (err) {
  //     debugPrint("Ip addresss error");
  //   }
  // }

  // Future<Position> getGeoLocationPosition() async {
  //   LocationPermission permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied ||
  //         permission == LocationPermission.deniedForever) {
  //       getIpAddress();
  //       return Future.error('Location permissions are denied');
  //     }
  //   }
  //   if (permission == LocationPermission.deniedForever) {
  //     getIpAddress();
  //     return Future.error(
  //         'Location permissions are permanently denied, we cannot request permissions.');
  //   }
  //   return await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high);
  // }

  Future<void> updateLanguage() async {
    if (isMyanmarLang.value) {
      updateLocale("en");
      isMyanmarLang.value = false;
    } else {
      updateLocale("mm");
      isMyanmarLang.value = true;
    }
  }

  Future<void> updateLocale(String key) async {
    final String languageCode = optionsLocales[key]['languageCode'];
    final String countryCode = optionsLocales[key]['countryCode'];
    // Update App
    // Get.updateLocale(Locale(languageCode, countryCode));
    // save
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(lang, key);
  }
}
