import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pricer/Features/home/presentation/manager/manage_database_projects_cubit/manage_projects_cubit.dart';
import 'package:pricer/Features/project_details/presentation/manager/time_counter_cubit/time_counter_cubit.dart';
import 'package:pricer/Features/project_details/presentation/views/widgets/custom_project_details_bar.dart';
import 'package:pricer/Features/project_details/presentation/views/widgets/manage_time_buttons.dart';
import 'package:pricer/Features/project_details/presentation/views/widgets/time_counter.dart';
import 'package:pricer/core/models/project_model.dart';
import 'package:pricer/core/utils/status_project.dart';

class ProjectDetailsViewBody extends StatelessWidget {
  const ProjectDetailsViewBody(
      {super.key, required this.projectModel, required this.color});
  final ProjectModel projectModel;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageProjectsCubit, ManageProjectsState>(
      builder: (context, state) {
        return BlocBuilder<TimeCounterCubit, TimeCounterState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomProjectDetailsBar(
                    color: color,
                    projectModel: projectModel,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      projectModel.projectName,
                      style: const TextStyle(
                        fontSize: 28,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      projectModel.clientName,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      '${projectModel.totalPrice.toStringAsFixed(2)}' r'$',
                      style: const TextStyle(
                          fontSize: 50, color: Color(0xff008000)),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  TimeCounter(
                    projectModel: projectModel,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Price per hour: ${projectModel.pricePerHour}' r'$',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Seconds don\'t count',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  const Spacer(),
                  projectModel.status == ProjectStatus.pending
                      ? ManageTimeButtons(
                          color: color,
                          projectModel: projectModel,
                        )
                      : const Center(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 30),
                            child: Text(
                              'Completed Project √',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
