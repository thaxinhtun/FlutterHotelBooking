import 'package:flutter/material.dart';

// import 'package:rabbitx_converter/rabbitx_converter.dart';

class CustomText extends StatelessWidget {
  final TextStyle textStyle;
  final String text;
  final bool? isAlignCenter;
  final int? maxLines;
  final bool? isSoftWrap;
  final TextOverflow? overflow;
  const CustomText(
      {Key? key,
      required this.text,
      required this.textStyle,
      this.isAlignCenter,
      this.maxLines,
      this.isSoftWrap,
      this.overflow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      // MDetect.isUnicode() ? text : RabbitxConverter.uni2zg(text),
      text,
      maxLines: maxLines,
      style: textStyle,
      textAlign: (isAlignCenter ?? false) ? TextAlign.center : null,
      softWrap: isSoftWrap,
      overflow: overflow,
    );
  }
}
