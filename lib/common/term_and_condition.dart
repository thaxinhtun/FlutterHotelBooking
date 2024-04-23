// import 'package:chitmaymay/common/terms_and_condition_widget.dart';
// import 'package:chitmaymay/utils/constants.dart';
// import 'package:chitmaymay/utils/style.dart';
// import 'package:chitmaymay/utils/widgets/custom_text.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:showcaseview/showcaseview.dart';

// import '../util/style.dart';

// class TermsAndConditionAgree extends StatelessWidget {
//   final bool isCheck;
//   final ValueChanged onChanged;
//   final bool isShowCaseView;
//   final GlobalKey? globalKey;
//   final bool? isPaymentTerms;

//   const TermsAndConditionAgree(
//       {Key? key,
//       required this.isCheck,
//       required this.onChanged,
//       required this.isShowCaseView,
//       this.globalKey,
//       this.isPaymentTerms})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // Size size = MediaQuery.of(context).size;
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
      
//            Checkbox(
//                 value: isCheck,
//                 onChanged: onChanged,
//                 checkColor: whiteColor,
//                 activeColor: context.theme.primaryColor,
//               ),
           
//         TermsAndConditionWidget()
//       ],
//     );
//   }
// }
