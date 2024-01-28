import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pricer/Features/home/presentation/manager/manage_database_projects_cubit/manage_projects_cubit.dart';
import 'package:pricer/constans.dart';
import 'package:pricer/core/models/project_model.dart';
import 'package:pricer/core/utils/check_screen_view.dart';
import 'package:pricer/core/utils/status_project.dart';
import 'package:pricer/core/widgets/project_item.dart';

class ProjectsGridPending extends StatefulWidget {
  const ProjectsGridPending({super.key});

  @override
  State<ProjectsGridPending> createState() => _ProjectsGridPendingState();
}

class _ProjectsGridPendingState extends State<ProjectsGridPending> {
  List<ProjectModel> projects = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ManageProjectsCubit, ManageProjectsState>(
      listener: (context, state) {
        if (state is GetProjectsDone) {
          projects = BlocProvider.of<ManageProjectsCubit>(context).projects;
        }
      },
      builder: (context, state) {
        List<ProjectModel> pendingProjects = projects
            .where((model) => model.status == ProjectStatus.pending)
            .toList();
        if (pendingProjects.isEmpty) {
          return const SliverToBoxAdapter(
            child: Center(
              child: Text(
                'No data!',
                style: TextStyle(fontSize: 32),
              ),
            ),
          );
        } else {
          return SliverGrid.builder(
            itemCount: isPendingView(context)
                ? pendingProjects.length
                : pendingProjects.length > 4
                    ? 4
                    : pendingProjects.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 10),
            itemBuilder: ((context, index) {
              return ProjectItem(
                color: pendingProjects[index].status == ProjectStatus.completed
                    ? kDoneColor
                    : kPendingColor,
                projectModel: pendingProjects[index],
                iconData: pendingProjects[index].status == ProjectStatus.pending
                    ? Icons.hourglass_bottom
                    : Icons.task_alt,
              );
            }),
          );
        }
      },
    );
  }
}
