import 'package:flutter/material.dart';
import 'package:pricer/constans.dart';

class ManageTimeButtons extends StatelessWidget {
  const ManageTimeButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Card(
          color: kSecond3Color,
          child: Icon(
            Icons.refresh,
            color: kPrimaryColor,
            size: 35,
          ),
        ),
        Icon(
          Icons.stop_circle,
          color: kSecond3Color,
          size: 80,
        ),
        Card(
          color: kSecond3Color,
          child: Icon(
            Icons.check,
            color: kPrimaryColor,
            size: 45,
          ),
        ),
      ],
    );
  }
}
