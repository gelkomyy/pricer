import 'package:flutter/material.dart';
import 'package:pricer/Features/project_details/presentation/views/widgets/edit_project_widget.dart';
import 'package:pricer/constans.dart';

class CustomProjectDetailsBar extends StatelessWidget {
  const CustomProjectDetailsBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.hourglass_bottom,
          color: kSecond3Color,
          size: 36,
        ),
        EditProject(),
      ],
    );
  }
}
