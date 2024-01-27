import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pricer/Features/home/presentation/manager/manage_database_projects_cubit/manage_projects_cubit.dart';
import 'package:pricer/Features/project_details/presentation/views/widgets/cutomize_edit_button.dart';
import 'package:pricer/constans.dart';
import 'package:pricer/core/models/project_model.dart';
import 'package:pricer/core/utils/status_project.dart';
import 'package:pricer/core/widgets/custom_num_box.dart';
import 'package:pricer/core/widgets/custom_text_field.dart';

class ModalBottomSheetEditWidget extends StatelessWidget {
  const ModalBottomSheetEditWidget({
    super.key,
    required List<GlobalKey<FormState>> formKeys,
    required List<TextEditingController> controllers,
    required this.projectModel,
  })  : _formKeys = formKeys,
        _controllers = controllers;
  final ProjectModel projectModel;
  final List<GlobalKey<FormState>> _formKeys;
  final List<TextEditingController> _controllers;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
            top: 16,
            right: 16,
            left: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () async {
                  bool confirmDelete =
                      await showDeleteConfirmationDialog(context);

                  if (confirmDelete) {
                    await BlocProvider.of<ManageProjectsCubit>(context)
                        .deleteModel(projectModel.id);
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  }
                },
                child: const Icon(
                  Icons.delete_forever,
                  color: Color.fromARGB(255, 176, 0, 0),
                  size: 38,
                ),
              ),
            ),
            const Text(
              'Edit Project',
              style: TextStyle(fontSize: 26, color: Colors.white70),
            ),
            const Divider(
              indent: 85,
              endIndent: 85,
            ),
            const SizedBox(
              height: 50,
            ),
            DropdownButtonFormField<String>(
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
            ),
            const SizedBox(
              height: 30,
            ),
            CustomTextBox(
              formKey: _formKeys[0],
              controller: _controllers[0],
              hintText: projectModel.projectName,
              iconData: Icons.pending,
            ),
            const SizedBox(
              height: 30,
            ),
            CustomTextBox(
              formKey: _formKeys[1],
              controller: _controllers[1],
              iconData: Icons.account_circle,
              hintText: projectModel.clientName,
            ),
            const SizedBox(
              height: 30,
            ),
            CustomNumBox(
              formKey: _formKeys[2],
              controller: _controllers[2],
              hintText: projectModel.pricePerHour.toString(),
              iconData: Icons.paid,
            ),
            const SizedBox(
              height: 30,
            ),
            CuromizeEditButton(
              formKeys: _formKeys,
              controllers: _controllers,
              projectModel: projectModel,
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
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

Future<bool> showDeleteConfirmationDialog(BuildContext context) async {
  return await showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Are you sure you want to delete?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false); // User pressed "No"
                },
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true); // User pressed "Yes"
                },
                child: const Text('Yes'),
              ),
            ],
          );
        },
      ) ??
      false; // Default to false if showDialog returns null
}
