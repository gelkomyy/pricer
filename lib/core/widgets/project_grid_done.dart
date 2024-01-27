import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pricer/Features/home/presentation/manager/manage_database_projects_cubit/manage_projects_cubit.dart';
import 'package:pricer/core/models/project_model.dart';
import 'package:pricer/core/utils/check_screen_view.dart';
import 'package:pricer/core/utils/status_project.dart';
import 'package:pricer/core/widgets/project_item.dart';

class ProjectsGridDone extends StatefulWidget {
  const ProjectsGridDone({super.key});

  @override
  State<ProjectsGridDone> createState() => _ProjectsGridDoneState();
}

class _ProjectsGridDoneState extends State<ProjectsGridDone> {
  List<ProjectModel> projects = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ManageProjectsCubit, ManageProjectsState>(
      listener: (context, state) async {
        if (state is GetProjectsDone) {
          projects = BlocProvider.of<ManageProjectsCubit>(context).projects;
        }
      },
      builder: (context, snapshot) {
        List<ProjectModel> doneProjects = projects
            .where((model) => model.status == ProjectStatus.completed)
            .toList();
        if (doneProjects.isEmpty) {
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
            itemCount: isCompletedView(context)
                ? doneProjects.length
                : doneProjects.length > 4
                    ? 4
                    : doneProjects.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 10),
            itemBuilder: ((context, index) {
              return ProjectItem(
                projectModel: doneProjects[index],
                iconData: doneProjects[index].status == ProjectStatus.pending
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
