import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hotel_akimomi/util/style.dart';
import 'package:hotel_akimomi/util/widget/custom_text.dart';
import 'package:intl/intl.dart';

DateFormat dayMonthNumberYearFormat = DateFormat('dd-MM-yyyy');
DateFormat yearMonthDateFormat = DateFormat('yyyy-MM-dd');
DateFormat dayMonthNameYearFormat = DateFormat('d-LLLL-yyyy');

var dayList = [
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9',
  '10',
  '11',
  '12',
  '13',
  '14',
  '15',
  '16',
  '17',
  '18',
  '19',
  '20',
  '21',
  '22',
  '23',
  '24',
  '25',
  '26',
  '27',
  '28',
  '29',
  '30',
  '31'
];
var monthList = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December'
];
var yearList = [
  '1960',
  '1961',
  '1962',
  '1963',
  '1964',
  '1965',
  '1966',
  '1967',
  '1968',
  '1969',
  '1970',
  '1971',
  '1972',
  '1973',
  '1974',
  '1975',
  '1976',
  '1977',
  '1978',
  '1979',
  '1980',
  '1981',
  '1982',
  '1983',
  '1984',
  '1985',
  '1986',
  '1987',
  '1988',
  '1989',
  '1990',
  '1991',
  '1992',
  '1993',
  '1994',
  '1995',
  '1996',
  '1997',
  '1998',
  '1999',
  '2000',
  '2001',
  '2002',
  '2003',
  '2004',
  '2005',
  '2006',
  '2007',
  '2008',
  '2009',
  '2010',
  '2011',
  '2012',
  '2013',
  '2014',
  '2015',
  '2016',
  '2017',
  '2018',
  '2019',
  '2020',
  '2021',
  '2022',
  '2023'
];

const List iconsList = [
  Icon(Icons.speed_rounded),
  Icon(Icons.high_quality),
];

const List iconsTitle = [
  "Playback speed",
  "Quality",
];

const List playbackOptions = [0.25, 0.5, 0.75, 1.0, 1.5, 1.75, 2.0];

String getRandomOrderId() {
  var number = "";
  var randomnumber = Random();
  for (var i = 0; i < 15; i++) {
    number = number + randomnumber.nextInt(9).toString();
  }
  return number;
}

String calculateTimeDifference(String date) {
  DateTime dateTime;
  var dayDifference = "".obs;
  if (date == '') {
    dateTime = DateTime.now();
    dayDifference.value = DateFormat('hh:mm a').format(dateTime);
  } else {
    dateTime = DateTime.parse(date);
    DateTime now = DateTime.now();
    DateTime localDateTime = dateTime.toLocal();
    DateTime yesterday = now.subtract(const Duration(days: 1));

    if (localDateTime.day == now.day &&
        localDateTime.month == now.month &&
        localDateTime.year == now.year) {
      dayDifference.value = DateFormat('hh:mm a').format(dateTime);
    } else if (localDateTime.day == yesterday.day &&
        localDateTime.month == now.month &&
        localDateTime.year == now.year) {
      dayDifference.value = "Yesterday";
    } else if (now.difference(localDateTime).inDays < 7) {
      dayDifference.value = DateFormat.EEEE().format(localDateTime);
    } else {
      dayDifference.value = DateFormat.MMMd().format(dateTime);
    }
  }
  return dayDifference.value;
}

Widget kDivider() => const Divider(
      color: greyColor,
      indent: 5,
      endIndent: 5,
    );

Widget kSpacer(Color color) => Container(
      width: double.infinity,
      height: 1,
      color: color,
    );

Widget kVerticalSpace(double height) => SizedBox(
      height: height,
    );

Widget kHorizontalSpace(double width) => SizedBox(
      width: width,
    );

Widget kTextFieldTitle(String label, Color color) {
  return Row(
    children: [
      kHorizontalSpace(10.0),
      CustomText(
        text: label,
        textStyle: kTextStyleCustom(14, color),
      ),
    ],
  );
}

TextStyle kTextStyleTitlePurple(double size) {
  return TextStyle(fontSize: size, color: titlePurpleColor);
}

TextStyle kTextStyleBoldBlack(double size) {
  return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.bold,
      color: blackColor,
      height: 1.5);
}

TextStyle kTextStyleBoldColor(double size) {
  return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.bold,
      color: backgroundDarkPurple,
      height: 1.5);
}

TextStyle kTextStyleBlack(double size) {
  return TextStyle(fontSize: size, color: blackColor, height: 1.5);
}

TextStyle kTextStyleWhite(double size) {
  return TextStyle(fontSize: size, color: whiteColor, height: 1.5);
}

TextStyle kTextStyleCustom(double size, Color color) {
  return TextStyle(fontSize: size, color: color, height: 1.5);
}

TextStyle kTextStyleBoldCustom(double size, Color color) {
  return TextStyle(
      fontSize: size, color: color, height: 1.5, fontWeight: FontWeight.bold);
}

TextStyle kTextStyleBoldWhite(double size) {
  return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.bold,
      color: whiteColor,
      height: 1.5);
}

TextStyle kTextStyleError(double size) {
  return TextStyle(fontSize: size, color: redColor);
}

TextStyle kTextStyleGrey(double size) {
  return TextStyle(fontSize: size, color: greyColor);
}

TextStyle kTextStyleColorCustom(double size, Color color) {
  return TextStyle(
    fontSize: size,
    color: color,
  );
}

TextStyle kTextStyleColor(double size) {
  return TextStyle(
    fontSize: size,
    color: backgroundDarkPurple,
  );
}

TextStyle kTextStyleGreen(double size) {
  return TextStyle(fontSize: size, color: greenColor, height: 1.5);
}

TextStyle kTextStyleColorUnderLine(double size) {
  return TextStyle(
      fontSize: size,
      color: backgroundDarkPurple,
      decoration: TextDecoration.underline);
}

TextStyle kTextStyleCustomUnderLine(double size, Color color) {
  return TextStyle(
      fontSize: size, color: color, decoration: TextDecoration.underline);
}

TextStyle kTextStyleTitle(double size, Color color) {
  return TextStyle(fontSize: size, color: color, fontWeight: FontWeight.bold);
}

extension NavigatorExtension<T> on BuildContext {
  Future<T?> next<T>(Widget w, {Function? result}) {
    return Navigator.push<T>(this, MaterialPageRoute(builder: (_) => w));
  }

  void back([T? result]) {
    return Navigator.pop(this, result);
  }
}

void showToast(String title) {
  Fluttertoast.showToast(
    msg: title,
    toastLength: Toast.LENGTH_SHORT,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.black,
    textColor: Colors.white,
    fontSize: 12.0,
  );
}

String getPointFormat(int points) {
  var f = NumberFormat("###,###", "en_US");
  return f.format(points);
}

String getCodeFormat(String code) {
  var buffer = StringBuffer();
  for (int i = 0; i < code.length; i++) {
    buffer.write(code[i]);
    var nonZeroIndex = i + 1;
    if (nonZeroIndex % 4 == 0 && nonZeroIndex != code.length) {
      buffer.write(
          ' '); // Replace this with anything you want to put after each 4 numbers
    }
  }

  return buffer.toString();
}

borders() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
      borderSide: const BorderSide(width: 1, color: lightGrey));
}

String generateCbOrderId() {
  var number = "";
  var randomnumber = Random();
  for (var i = 0; i < 6; i++) {
    number = number + randomnumber.nextInt(9).toString();
  }
  return number;
}

String getYear(String date) {
  List<String> split = date.split(' ');
  return split[2];
}

String getMonthDay(String date) {
  List<String> split = date.split(' ');
  return '${split[1]} ${split[0]}';
}

String getViewCount(int count) {
  var _formattedNumber = NumberFormat.compactCurrency(
    decimalDigits: 0,
    symbol: '',
  ).format(count);
  return _formattedNumber;
}

bool checkToshowDate(String date1, String date2) {
  if (getDate(date1) == getDate(date2)) {
    return true;
  } else {
    return false;
  }
}

String getDate(String createdAt) {
  DateTime now = DateTime.now();
  DateTime createDate = DateFormat('yyyy-MM-dd hh:mm:ss').parse(createdAt);
  if (now.year == createDate.year &&
      now.month == createDate.month &&
      now.day == createDate.day) {
    return 'Today';
  }
  String dt = DateFormat('EEEE, MMM dd, yyyy').format(createDate);
  return dt;
}

String getTime(String createdAt) {
  String dt = DateFormat('hh:mm a').format(DateTime.parse(createdAt));
  return dt;
}

String getDeviceType() {
  final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
  return data.size.shortestSide < 550 ? 'phone' : 'tablet';
}

String getPhone(String phone) {
  if (phone.length == 14) {
    String ph = phone.substring(4, 14);
    return '+95' + ph;
  }
  return phone;
}

String toPhone(String phone) {
  if (phone.length == 13) {
    String ph = phone.substring(3, 13);
    return '+950' + ph;
  }
  return phone;
}
