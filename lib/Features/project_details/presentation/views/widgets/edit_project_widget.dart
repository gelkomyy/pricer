import 'package:flutter/material.dart';
import 'package:pricer/Features/project_details/presentation/views/widgets/modal_bottom_sheet_edit_widget.dart';
import 'package:pricer/constans.dart';
import 'package:pricer/core/models/project_model.dart';

class EditProject extends StatefulWidget {
  const EditProject(
      {super.key, required this.projectModel, required this.color});
  final ProjectModel projectModel;
  final Color color;
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
        _controllers[0].text = widget.projectModel.projectName;
        _controllers[1].text = widget.projectModel.clientName;
        _controllers[2].text = widget.projectModel.pricePerHour.toString();

        showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: kPrimaryColor,
            useSafeArea: true,
            context: context,
            builder: (context) {
              return ModalBottomSheetEditWidget(
                color: widget.color,
                formKeys: _formKeys,
                controllers: _controllers,
                projectModel: widget.projectModel,
              );
            });
      },
      child: Card(
        color: widget.color,
        child: const Icon(
          Icons.edit,
          color: kPrimaryColor,
          size: 38,
        ),
      ),
    );
  }
}
