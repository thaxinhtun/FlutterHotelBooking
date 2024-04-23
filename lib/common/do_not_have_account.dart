import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_akimomi/auth/sign_up_screen.dart';

import '../util/constant.dart';

class DonnotHaveAccount extends StatelessWidget {
  const DonnotHaveAccount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final CommonController controller = Get.put(CommonController());
    return GestureDetector(
      onTap: () {
        Get.off(() => SignUpScreen());
        // Get.off(() => ShowCaseWidget(
        //       blurValue: 0.5,
        //       builder: Builder(builder: (context) => const LaunchScreen()),
        //     ));
      },
      child: RichText(
        text: TextSpan(
          text: 'donnot_have_account'.tr,
          style: kTextStyleError(12),
          children: [
            TextSpan(
              text: 'signup'.tr,
              style: kTextStyleCustom(14, context.theme.primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
