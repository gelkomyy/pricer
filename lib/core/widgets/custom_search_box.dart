import 'package:flutter/material.dart';
import 'package:pricer/constans.dart';

class CustomSearchBox extends StatelessWidget {
  const CustomSearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.price_change,
          size: 30,
          color: Color.fromARGB(255, 82, 220, 255),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          'ElKoMy Pricer',
          style: TextStyle(fontSize: 20),
        ),
      ],
    );

    return TextField(
      cursorHeight: 13,
      cursorOpacityAnimates: true,
      cursorColor: kPendingColor,
      style: const TextStyle(
        height: 0.5,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        prefixIcon: const Icon(Icons.search),
        hintText: 'Search Project',
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
      borderRadius: BorderRadius.circular(20),
    );
  }

  OutlineInputBorder focusBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
          color: kPendingColor, style: BorderStyle.solid, width: 2),
      borderRadius: BorderRadius.circular(20),
    );
  }
}
