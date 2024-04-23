import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PaymentTextFormField extends StatelessWidget {
  final String hintText;
  final TextInputType textInputType;
  final IconData prefixIcon;
  final int? limitLength;
  final List<TextInputFormatter>? formatterList;
  final TextEditingController textEditingController;

  const PaymentTextFormField({
    super.key,
    required this.hintText,
    required this.textInputType,
    required this.prefixIcon,
    this.limitLength,
    this.formatterList,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(hintText),
        TextFormField(
          keyboardType: textInputType,
          controller: textEditingController,
          inputFormatters: formatterList,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Icon(
                prefixIcon,
                color: Colors.grey,
              ),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none),
            filled: true,
            fillColor: const Color.fromARGB(255, 248, 246, 246),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Color.fromARGB(255, 248, 246, 246)),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
