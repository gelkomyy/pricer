import 'package:flutter/material.dart';
import 'package:pricer/constans.dart';

class CustomTextBox extends StatelessWidget {
  const CustomTextBox({super.key, required this.text, required this.iconData});
  final String text;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorHeight: 15,
      cursorOpacityAnimates: true,
      cursorColor: kSecond3Color,
      style: const TextStyle(
        height: 0.7,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        prefixIcon: Icon(iconData),
        hintText: text,
        hintStyle: TextStyle(color: Colors.black.withOpacity(0.4)),
        prefixIconColor: Colors.black.withOpacity(0.6),
        border: mainBorder(),
        focusedBorder: focusBorder(),
        enabledBorder: mainBorder(),
      ),
    );
  }

  OutlineInputBorder mainBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        style: BorderStyle.none,
      ),
      borderRadius: BorderRadius.circular(18),
    );
  }

  OutlineInputBorder focusBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
          color: kSecond3Color, style: BorderStyle.solid, width: 2),
      borderRadius: BorderRadius.circular(18),
    );
  }
}
