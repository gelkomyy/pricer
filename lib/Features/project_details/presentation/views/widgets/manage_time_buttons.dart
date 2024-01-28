import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pricer/Features/home/presentation/manager/manage_database_projects_cubit/manage_projects_cubit.dart';
import 'package:pricer/Features/project_details/presentation/manager/time_counter_cubit/time_counter_cubit.dart';
import 'package:pricer/constans.dart';
import 'package:pricer/core/models/project_model.dart';
import 'package:pricer/core/utils/status_project.dart';

class ManageTimeButtons extends StatelessWidget {
  const ManageTimeButtons({
    super.key,
    required this.projectModel,
    required this.color,
  });
  final ProjectModel projectModel;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () {
            BlocProvider.of<TimeCounterCubit>(context).resetTime();
          },
          child: Card(
            color: color,
            child: const Icon(
              Icons.refresh,
              color: kPrimaryColor,
              size: 35,
            ),
          ),
        ),
        BlocBuilder<TimeCounterCubit, TimeCounterState>(
          builder: (context, state) {
            return InkWell(
              onTap: () {
                BlocProvider.of<TimeCounterCubit>(context).playTime();
              },
              child: Icon(
                BlocProvider.of<TimeCounterCubit>(context).counterIsRunning
                    ? Icons.pause_circle
                    : Icons.play_circle,
                color: color,
                size: 80,
              ),
            );
          },
        ),
        InkWell(
          onTap: () {
            projectModel.status = ProjectStatus.completed;
            BlocProvider.of<TimeCounterCubit>(context).stopTime();
            BlocProvider.of<ManageProjectsCubit>(context)
                .editProject(projectModel);
          },
          child: Card(
            color: color,
            child: const Icon(
              Icons.check,
              color: kPrimaryColor,
              size: 45,
            ),
          ),
        ),
      ],
    );
  }
}
