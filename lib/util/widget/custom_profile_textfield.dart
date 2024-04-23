import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant.dart';
import '../style.dart';
import 'custom_text.dart';

class CustomProfileTextfield extends StatelessWidget {
  final TextEditingController? controller;
  final String label;
  final String hintText;
  final VoidCallback? onTap;
  final bool? readOnly;
  final bool? isObsecure;
  final bool? isTextArea;
  final String? suffixLabel;
  final Color? fillColor;
  const CustomProfileTextfield(
      {Key? key,
      this.controller,
      required this.label,
      required this.hintText,
      this.onTap,
      this.readOnly,
      this.isObsecure,
      this.isTextArea,
      this.suffixLabel,
      this.fillColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: kTextStyleCustom(12, dividerGrey),
        ),
        SizedBox(
          height: 40,
          child: Stack(
            children: [
              TextField(
                obscureText: isObsecure ?? false,
                readOnly: readOnly ?? false,
                controller: controller,
                maxLines: (isTextArea ?? false) ? 6 : 1,
                style: kTextStyleCustom(
                  14,
                  context.theme.colorScheme.primary,
                ),
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    filled: true,
                    fillColor:
                        fillColor ?? context.theme.colorScheme.background,
                    contentPadding: const EdgeInsets.only(left: 8),
                    hintText: hintText,
                    hintStyle: kTextStyleGrey(14),
                    border: InputBorder.none,
                    enabledBorder: _borders(),
                    focusedBorder: _borders(),
                    disabledBorder: _borders()),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: onTap,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: CustomText(
                      text: suffixLabel ?? '',
                      textStyle: kTextStyleColor(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _borders() {
    return UnderlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(width: 1, color: backButtonColor));
  }
}
