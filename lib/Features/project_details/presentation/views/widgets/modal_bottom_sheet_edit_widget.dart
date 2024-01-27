import 'package:flutter/material.dart';
import 'package:pricer/Features/project_details/presentation/views/widgets/cutomize_edit_button.dart';
import 'package:pricer/core/models/project_model.dart';
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
            CustomTextBox(
              formKey: _formKeys[0],
              controller: _controllers[0],
              text: projectModel.projectName,
              iconData: Icons.pending,
            ),
            const SizedBox(
              height: 30,
            ),
            CustomTextBox(
              formKey: _formKeys[1],
              controller: _controllers[1],
              iconData: Icons.account_circle,
              text: projectModel.clientName,
            ),
            const SizedBox(
              height: 30,
            ),
            CustomNumBox(
              formKey: _formKeys[2],
              controller: _controllers[2],
              text: projectModel.pricePerHour.toString(),
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
}
