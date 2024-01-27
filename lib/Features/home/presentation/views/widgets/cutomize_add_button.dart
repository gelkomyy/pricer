import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pricer/Features/home/presentation/manager/manage_database_projects_cubit/manage_projects_cubit.dart';
import 'package:pricer/constans.dart';
import 'package:pricer/core/models/project_model.dart';
import 'package:pricer/core/widgets/custom_snackbar.dart';

class CuromizeAddButton extends StatelessWidget {
  const CuromizeAddButton({
    super.key,
    required List<GlobalKey<FormState>> formKeys,
    required this.controllers,
  }) : _formKeys = formKeys;

  final List<GlobalKey<FormState>> _formKeys;
  final List<TextEditingController> controllers;

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

  void onTapAdd(BuildContext context) async {
    bool isValid = true;

    for (var formKey in _formKeys) {
      if (!(formKey.currentState!.validate())) {
        isValid = false;
      }
    }

    if (isValid) {
      String projectName = controllers[0].text;
      String clientName = controllers[1].text;
      num pricePerHour = num.parse(controllers[2].text);
      int lastId = await BlocProvider.of<ManageProjectsCubit>(context)
          .getLastInsertedId();
      await BlocProvider.of<ManageProjectsCubit>(context).addProject(
          ProjectModel(
              pricePerHour: pricePerHour,
              id: lastId + 1,
              status: 'pending',
              projectName: projectName,
              clientName: clientName,
              totalPrice: 0,
              totalHours: 0));
      Navigator.of(context).pop();

      cutomSnackBar(context, 'Add Done.');
      for (var controller in controllers) {
        controller.clear();
      }
    }
  }
}
