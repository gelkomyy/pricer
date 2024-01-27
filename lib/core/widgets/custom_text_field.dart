import 'package:flutter/material.dart';
import 'package:pricer/constans.dart';

class CustomTextBox extends StatelessWidget {
  const CustomTextBox({
    super.key,
    required this.hintText,
    required this.iconData,
    required this.controller,
    required this.formKey,
  });

  final String hintText;
  final IconData iconData;
  final TextEditingController controller;

  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: formKey,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a value';
          }
          return null;
        },
        controller: controller,
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
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.black.withOpacity(0.4)),
          prefixIconColor: Colors.black.withOpacity(0.6),
          border: mainBorder(),
          focusedBorder: focusBorder(),
          enabledBorder: mainBorder(),
        ),
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
