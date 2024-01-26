import 'package:flutter/material.dart';
import 'package:pricer/constans.dart';
import 'package:pricer/core/widgets/custom_snackbar.dart';

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
          onTapAdd(context);
        },
        child: const Text(
          'Add √',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ));
  }

  void onTapAdd(BuildContext context) {
    bool isValid = true;

    for (var formKey in _formKeys) {
      if (!(formKey.currentState!.validate())) {
        isValid = false;
      }
    }

    if (isValid) {
      Navigator.of(context).pop();
      cutomSnackBar(context, 'Add Done.');
    }
  }
}
