import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant.dart';
import '../style.dart';
import 'custom_text.dart';

class CustomDropDownButton extends StatelessWidget {
  final List<String> items;
  final Function(String?) onChange;
  final String title;
  final String? selectedValue;
  const CustomDropDownButton(
      {Key? key,
      required this.items,
      required this.onChange,
      required this.title,
      this.selectedValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        hint: Row(
          children: [
            Expanded(
              child: CustomText(
                text: title,
                textStyle:
                    kTextStyleCustom(12, context.theme.colorScheme.primary),
              ),
            ),
          ],
        ),
        items: items
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: CustomText(
                      text: item,
                      textStyle: kTextStyleCustom(
                          14, context.theme.colorScheme.primary)),
                ))
            .toList(),
        value: selectedValue,
        onChanged: onChange,
        buttonStyleData: ButtonStyleData(
          height: 45,
          width: double.infinity,
          padding: const EdgeInsets.only(left: 14, right: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
                // color: backButtonColor.withOpacity(0.5),
                color: Colors.grey),
            color: context.theme.colorScheme.background,
          ),
          elevation: 0,
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.keyboard_arrow_down,
            size: 20,
          ),
          iconSize: 18,
          iconEnabledColor: Colors.grey,
          iconDisabledColor: Colors.grey,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 200,
          width: MediaQuery.of(context).size.width - 30,
          padding: const EdgeInsets.only(left: 14, right: 14),
          decoration: BoxDecoration(
            color: Colors.grey[200],
          ),
          elevation: 0,
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(25),
            thickness: MaterialStateProperty.all<double>(6),
            thumbVisibility: MaterialStateProperty.all<bool>(true),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
          padding: EdgeInsets.only(left: 14, right: 14),
        ),
      ),
    );
  }
}
