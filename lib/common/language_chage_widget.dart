
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class LanguateChangeWidget extends StatefulWidget {
//   const LanguateChangeWidget({Key? key}) : super(key: key);

//   @override
//   State<LanguateChangeWidget> createState() => _LanguateChangeWidgetState();
// }

// class _LanguateChangeWidgetState extends State<LanguateChangeWidget> {
//   final LanguageController _controller = Get.find<LanguageController>();
//   final CommonsController commonsController = Get.find<CommonsController>();
//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       return Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           CustomText(
//             text: 'english'.tr,
//             textStyle: (_controller.isMyanmarLang.value == true)
//                 ? commonsController.isSingUpStepsCard.value
//                     ? const TextStyle(fontSize: 12, color: Colors.white)
//                     : kTextStyleGrey(12)
//                 : kTextStyleError(12),
//           ),
//           Switch(
//             value: _controller.isMyanmarLang.value,
//             onChanged: (value) {
//               _controller.updateLanguage();
//             },
//             activeTrackColor: context.theme.primaryColor,
//             activeColor: Colors.white,
//           ),
//           CustomText(
//             text: 'myanmar'.tr,
//             textStyle: (_controller.isMyanmarLang.value == true)
//                 ? kTextStyleError(12)
//                 : commonsController.isSingUpStepsCard.value
//                     ? const TextStyle(color: Colors.white, fontSize: 12)
//                     : kTextStyleGrey(12),
//           )
//         ],
//       );
//     });
//   }
// }
