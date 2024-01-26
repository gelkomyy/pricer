import 'package:flutter/material.dart';
import 'package:pricer/Features/project_details/presentation/views/widgets/modal_bottom_sheet_edit_widget.dart';
import 'package:pricer/constans.dart';

class EditProject extends StatefulWidget {
  const EditProject({super.key});

  @override
  State<EditProject> createState() => _EditProjectState();
}

class _EditProjectState extends State<EditProject> {
  final List<GlobalKey<FormState>> _formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];
  final List<TextEditingController> _controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: kPrimaryColor,
            useSafeArea: true,
            context: context,
            builder: (context) {
              return ModalBottomSheetEditWidget(
                  formKeys: _formKeys, controllers: _controllers);
            });
      },
      child: const Card(
        color: kSecond3Color,
        child: Icon(
          Icons.edit,
          color: kPrimaryColor,
          size: 38,
        ),
      ),
    );
  }
}
