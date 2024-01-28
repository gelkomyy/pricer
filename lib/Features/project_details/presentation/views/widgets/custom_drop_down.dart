import 'package:flutter/material.dart';
import 'package:pricer/constans.dart';
import 'package:pricer/core/models/project_model.dart';
import 'package:pricer/core/utils/status_project.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({super.key, required this.projectModel});
  final ProjectModel projectModel;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: 'Select an status',
        border: mainBorderDropDown(),
        enabledBorder: mainBorderDropDown(),
      ),
      // elevation: 0,
      value: projectModel.status,
      onChanged: (String? newValue) {
        projectModel.status = newValue ?? projectModel.status;
      },
      items: <String>[
        ProjectStatus.pending,
        ProjectStatus.completed,
      ].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Row(
            children: [
              Icon(
                value == ProjectStatus.pending
                    ? Icons.hourglass_bottom
                    : Icons.task_alt,
                color: kSecond3Color,
                size: 30,
              ),
              const SizedBox(
                width: 15,
              ),
              Text(value),
            ],
          ),
        );
      }).toList(),
    );
  }

  OutlineInputBorder mainBorderDropDown() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(
          width: 1,
          color: Colors.white,
        ));
  }
}
