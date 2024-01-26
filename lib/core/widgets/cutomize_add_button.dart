import 'package:flutter/material.dart';
import 'package:pricer/constans.dart';

class CuromizeAddButton extends StatelessWidget {
  const CuromizeAddButton({
    super.key,
    required List<GlobalKey<FormState>> formKeys,
  }) : _formKeys = formKeys;

  final List<GlobalKey<FormState>> _formKeys;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(150, 30), backgroundColor: kSecond2Color),
        onPressed: () {
          bool isValid = true;

          for (var formKey in _formKeys) {
            if (!(formKey.currentState!.validate())) {
              isValid = false;
            }
          }

          if (isValid) {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              behavior: SnackBarBehavior.floating,
              showCloseIcon: true,
              backgroundColor: kSecondColor,
              closeIconColor: const Color.fromARGB(255, 154, 9, 9),
              margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              content: const Text(
                'Add Done.',
                style: TextStyle(color: Colors.white),
              ),
            ));
          }
        },
        child: const Text(
          'Add √',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ));
  }
}
