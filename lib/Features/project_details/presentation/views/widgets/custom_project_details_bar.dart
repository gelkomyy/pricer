import 'package:flutter/material.dart';
import 'package:pricer/Features/project_details/presentation/views/widgets/edit_project_widget.dart';
import 'package:pricer/constans.dart';
import 'package:pricer/core/models/project_model.dart';
import 'package:pricer/core/utils/status_project.dart';

class CustomProjectDetailsBar extends StatelessWidget {
  const CustomProjectDetailsBar({
    super.key,
    required this.projectModel,
    required this.color,
  });
  final ProjectModel projectModel;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          projectModel.status == ProjectStatus.pending
              ? Icons.hourglass_bottom
              : Icons.task_alt,
          color: color,
          size: 36,
        ),
        EditProject(
          projectModel: projectModel,
          color: color,
        ),
      ],
    );
  }
}
