import 'package:get/get.dart';

class HomeController extends GetxController {
  var roomCount = 1.obs;
  var adultCount = 1.obs;
  var startDate = DateTime.now().obs;
  var endDate = DateTime.now().add(const Duration(days: 1)).obs;
  var chooseRoomTYpe = "".obs;

  var sleeps = 0.obs;
}
