import 'package:flutter/material.dart';
import 'package:pricer/Features/home/presentation/views/widgets/cutomize_add_button.dart';
import 'package:pricer/core/widgets/custom_num_box.dart';
import 'package:pricer/core/widgets/custom_text_field.dart';

class ModalBottomSheetWidget extends StatelessWidget {
  const ModalBottomSheetWidget({
    super.key,
    required List<GlobalKey<FormState>> formKeys,
    required List<TextEditingController> controllers,
  })  : _formKeys = formKeys,
        _controllers = controllers;

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
              'Add Project',
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
              text: 'Project name',
              iconData: Icons.pending,
            ),
            const SizedBox(
              height: 30,
            ),
            CustomTextBox(
              formKey: _formKeys[1],
              controller: _controllers[1],
              iconData: Icons.account_circle,
              text: 'Client name',
            ),
            const SizedBox(
              height: 30,
            ),
            CustomNumBox(
              formKey: _formKeys[2],
              controller: _controllers[2],
              text: 'Price per hour',
              iconData: Icons.paid,
            ),
            const SizedBox(
              height: 30,
            ),
            CuromizeAddButton(
              formKeys: _formKeys,
              controllers: _controllers,
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
