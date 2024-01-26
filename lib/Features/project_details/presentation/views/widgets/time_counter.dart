import 'package:flutter/material.dart';
import 'package:pricer/constans.dart';

class TimeCounter extends StatelessWidget {
  const TimeCounter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: kSecondColor,
      elevation: 17,
      shape:
          ContinuousRectangleBorder(borderRadius: BorderRadius.circular(105)),
      color: kSecondColor,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '00:00',
            style: TextStyle(
              fontSize: 90,
            ),
          ),
          Text(
            ':00',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ],
      ),
    );
  }
}
