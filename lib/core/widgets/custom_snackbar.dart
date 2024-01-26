import 'package:flutter/material.dart';
import 'package:pricer/constans.dart';

void cutomSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    behavior: SnackBarBehavior.floating,
    showCloseIcon: true,
    backgroundColor: kSecondColor,
    closeIconColor: const Color.fromARGB(255, 154, 9, 9),
    margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    content: Text(
      text,
      style: const TextStyle(color: Colors.white),
    ),
  ));
}
