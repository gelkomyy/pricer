import 'package:flutter/material.dart';
import 'package:pricer/Features/project_details/presentation/views/widgets/edit_project_widget.dart';
import 'package:pricer/constans.dart';
import 'package:pricer/core/models/project_model.dart';

class CustomProjectDetailsBar extends StatelessWidget {
  const CustomProjectDetailsBar({
    super.key,
    required this.projectModel,
  });
  final ProjectModel projectModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          projectModel.status == 'pending'
              ? Icons.hourglass_bottom
              : Icons.task_alt,
          color: kSecond3Color,
          size: 36,
        ),
        EditProject(
          projectModel: projectModel,
        ),
      ],
    );
  }
}
