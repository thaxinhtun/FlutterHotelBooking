import 'dart:io';

import 'package:flutter/material.dart';

class CustomImageUpload extends StatelessWidget {
  final VoidCallback onTap;
  final File? image;
  final String dbImg;
  const CustomImageUpload(
      {super.key, required this.onTap, this.image, required this.dbImg});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(border: Border.all(color: Colors.indigo)),
          child: image != null
              ? dbImg != ""
                  ? Image.network(
                      dbImg,
                      fit: BoxFit.fill,
                    )
                  : Image.file(
                      image!,
                      fit: BoxFit.fill,
                    )
              : const Center(
                  child: Icon(
                    Icons.upload,
                    color: Colors.indigo,
                  ),
                )),
    );
  }
}
