import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pricer/Features/home/presentation/manager/manage_database_projects_cubit/manage_projects_cubit.dart';
import 'package:pricer/constans.dart';
import 'package:pricer/core/models/project_model.dart';
import 'package:pricer/core/widgets/custom_snackbar.dart';

class CuromizeEditButton extends StatelessWidget {
  const CuromizeEditButton({
    super.key,
    required List<GlobalKey<FormState>> formKeys,
    required this.projectModel,
    required this.controllers,
    required this.color,
  }) : _formKeys = formKeys;

  final List<GlobalKey<FormState>> _formKeys;
  final List<TextEditingController> controllers;
  final ProjectModel projectModel;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(150, 30), backgroundColor: color),
        onPressed: () {
          onTapAdd(context);
        },
        child: const Text(
          'Edit √',
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
      projectModel.projectName = controllers[0].text;
      projectModel.clientName = controllers[1].text;
      projectModel.pricePerHour = num.parse(controllers[2].text);

      BlocProvider.of<ManageProjectsCubit>(context).editProject(projectModel);
      Navigator.of(context).pop();
      cutomSnackBar(context, 'Edit Done.');
      for (var controller in controllers) {
        controller.clear();
      }
    }
  }
}
