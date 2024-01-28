import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pricer/Features/home/presentation/manager/manage_database_projects_cubit/manage_projects_cubit.dart';
import 'package:pricer/core/models/project_model.dart';
import 'package:pricer/core/utils/show_confirmation_dialog.dart';
import 'package:pricer/core/widgets/custom_snackbar.dart';

class CustomDeleteProjectButton extends StatelessWidget {
  const CustomDeleteProjectButton({
    super.key,
    required this.projectModel,
  });

  final ProjectModel projectModel;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: InkWell(
        onTap: () async {
          bool confirmDelete = await showConfirmationDialog(
              context: context, text: 'Are you sure you want to delete?');

          if (confirmDelete) {
            await BlocProvider.of<ManageProjectsCubit>(context)
                .deleteModel(projectModel.id);
            cutomSnackBar(context, 'Delete Done.');
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
    );
  }
}
