import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String label;
  final String hintText;
  final VoidCallback? onTap;
  final bool? readOnly;
  final bool? isObsecure;
  final bool? isKeyboardTypeNumber;
  final VoidCallback? updateSeen;
  final bool? showSuffixIcon;
  final Function(String)? onChange;
  final VoidCallback? onEditComplete;
  final FocusNode? textFocusNode;
  const CustomTextField(
      {Key? key,
      this.controller,
      required this.label,
      required this.hintText,
      this.onTap,
      this.readOnly,
      this.isObsecure,
      this.isKeyboardTypeNumber,
      this.updateSeen,
      this.showSuffixIcon,
      this.onChange,
      this.onEditComplete,
      this.textFocusNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kTextFieldTitle(label, context.theme.focusColor),
        kVerticalSpace(4),
        SizedBox(
          height: 45,
          child: Center(
            child: TextField(
              focusNode: textFocusNode,
              obscureText: isObsecure ?? false,
              readOnly: readOnly ?? false,
              keyboardType:
                  (isKeyboardTypeNumber ?? false) ? TextInputType.number : null,
              controller: controller,
              style: kTextStyleCustom(
                14,
                context.theme.colorScheme.primary,
              ),
              onTap: onTap,
              onChanged: onChange,
              onEditingComplete: onEditComplete,
              decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  filled: true,
                  suffixIcon: (showSuffixIcon ?? false)
                      ? IconButton(
                          icon: Icon(
                            (isObsecure ?? false)
                                ? Icons.visibility
                                : Icons.visibility_off,
                            size: 20,
                            color: context.theme.focusColor,
                          ),
                          onPressed: updateSeen,
                        )
                      : null,
                  fillColor: context.theme.colorScheme.outline,
                  contentPadding: const EdgeInsets.only(left: 15),
                  hintText: hintText,
                  hintStyle: kTextStyleGrey(16),
                  border: InputBorder.none,
                  enabledBorder: _borders(context.theme.primaryColorLight),
                  focusedBorder: _focusedBorders(context.theme.primaryColor),
                  disabledBorder:
                      _borders(context.theme.colorScheme.secondary)),
            ),
          ),
        ),
      ],
    );
  }

  _focusedBorders(color) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(width: 1, color: color));
  }

  _borders(color) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(width: 1, color: color));
  }
}
