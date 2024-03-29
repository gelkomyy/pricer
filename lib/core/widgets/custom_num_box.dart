import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pricer/constans.dart';

class CustomNumBox extends StatelessWidget {
  const CustomNumBox(
      {super.key,
      required this.hintText,
      required this.iconData,
      required this.controller,
      required this.formKey});
  final String hintText;
  final IconData iconData;
  final TextEditingController controller;
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a value';
          }
          return null;
        },
        controller: controller,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,4}$'))
        ],
        cursorHeight: 15,
        cursorOpacityAnimates: true,
        cursorColor: kPendingColor,
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
          color: kPendingColor, style: BorderStyle.solid, width: 2),
      borderRadius: BorderRadius.circular(18),
    );
  }
}
