import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pricer/Features/project_details/presentation/manager/time_counter_cubit/time_counter_cubit.dart';
import 'package:pricer/Features/project_details/presentation/views/widgets/project_details_view_body.dart';
import 'package:pricer/constans.dart';
import 'package:pricer/core/models/project_model.dart';

class ProjectDetailsView extends StatelessWidget {
  const ProjectDetailsView(
      {super.key, required this.projectModel, required this.color});
  static String id = 'ProjectDetailsView';
  final ProjectModel projectModel;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kPrimaryColor,
      body: SafeArea(
          child: BlocProvider(
        create: (context) =>
            TimeCounterCubit(projectModel.minutes.toInt() * 60),
        child: ProjectDetailsViewBody(
          projectModel: projectModel,
        ),
      )),
    );
  }
}
