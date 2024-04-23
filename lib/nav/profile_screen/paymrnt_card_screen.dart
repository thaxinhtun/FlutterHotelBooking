import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:hotel_akimomi/controller/booking_controller.dart';

import '../../controller/payment_controller.dart';
import '../../util/constant.dart';
import '../../util/style.dart';
import '../../util/widget/custom_button.dart';
import '../../util/widget/custom_text.dart';
import '../../util/widget/payment_text_form_field.dart';

class PaymentCardScreen extends StatefulWidget {
  final bool isFromBooking;
  const PaymentCardScreen({super.key, required this.isFromBooking});

  @override
  State<PaymentCardScreen> createState() => _PaymentCardScreenState();
}

class _PaymentCardScreenState extends State<PaymentCardScreen> {
  final PaymentController paymentController = Get.put(PaymentController());
  final BookingController bookingController = Get.put(BookingController());

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    await paymentController.initCardData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: CustomText(
          text: 'Payment Detail',
          textStyle: kTextStyleCustom(16, context.theme.colorScheme.onPrimary),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: context.theme.colorScheme.surface,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            children: [
              Form(
                  child: Column(
                children: [
                  PaymentTextFormField(
                    hintText:
                        paymentController.cardNoController.value.text == ""
                            ? 'Card Number'
                            : paymentController.cardNoController.value.text,
                    textEditingController: paymentController.cardNoController,
                    prefixIcon: Icons.payment,
                    textInputType: TextInputType.number,
                    formatterList: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(19),
                      CardNumberInputFormatter()
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  PaymentTextFormField(
                    hintText:
                        paymentController.cardNameController.value.text == ""
                            ? 'Name On Card '
                            : paymentController.cardNameController.value.text,
                    textEditingController: paymentController.cardNameController,
                    prefixIcon: Icons.person,
                    textInputType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: PaymentTextFormField(
                          hintText:
                              paymentController.cvvController.value.text == ""
                                  ? 'CVV '
                                  : paymentController.cvvController.value.text,
                          textEditingController:
                              paymentController.cvvController,
                          prefixIcon: Icons.card_giftcard,
                          textInputType: TextInputType.number,
                          formatterList: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(3),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: PaymentTextFormField(
                          hintText: paymentController
                                      .cardExpireController.value.text ==
                                  ""
                              ? 'MM/YY'
                              : paymentController
                                  .cardExpireController.value.text,
                          textEditingController:
                              paymentController.cardExpireController,
                          prefixIcon: Icons.date_range,
                          formatterList: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(4),
                            CardMonthInputFormatter()
                          ],
                          textInputType: TextInputType.number,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: CustomButton(
                      backgroundColor: context.theme.primaryColor,
                      textStyle: kTextStyleWhite(14),
                      label: widget.isFromBooking ? "Book Now" : 'Add Card',
                      onTap: () {
                        if (widget.isFromBooking) {
                          bookingController.bookRooms();
                        } else {
                          paymentController.validateField(
                              context,
                              paymentController.cardNoController.text,
                              paymentController.cardNameController.text,
                              paymentController.cvvController.text,
                              paymentController.cardExpireController.text);
                        }
                      },
                    ),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    String inputData = newValue.text;
    StringBuffer buffer = StringBuffer();

    for (var i = 0; i < inputData.length; i++) {
      buffer.write(inputData[i]);
      int index = i + 1;

      if (index % 4 == 0 && inputData.length != index) {
        buffer.write(" ");
      }
    }
    return TextEditingValue(
        text: buffer.toString(),
        selection: TextSelection.collapsed(offset: buffer.toString().length));
  }
}

class CardMonthInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var inputData = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = StringBuffer();

    for (var i = 0; i < inputData.length; i++) {
      buffer.write(inputData[i]);

      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 2 == 0 && nonZeroIndex != inputData.length) {
        buffer.write("/");
      }
    }
    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}
