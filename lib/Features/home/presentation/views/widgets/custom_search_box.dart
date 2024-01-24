import 'package:flutter/material.dart';

class CustomSearchBox extends StatelessWidget {
  const CustomSearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: const Color.fromARGB(255, 31, 79, 162),
      style: TextStyle(
        height: 0.5,
        color: Colors.black.withOpacity(0.9),
      ),
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        prefixIcon: const Icon(Icons.search),
        hintText: 'Search Project',
        hintStyle: TextStyle(color: Colors.black.withOpacity(0.4)),
        prefixIconColor: Colors.black.withOpacity(0.7),
        border: mainBorder(),
        enabledBorder: mainBorder(),
      ),
    );
  }

  OutlineInputBorder mainBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        style: BorderStyle.none,
      ),
      borderRadius: BorderRadius.circular(24),
    );
  }
}
