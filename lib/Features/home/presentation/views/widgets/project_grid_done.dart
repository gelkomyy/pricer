import 'package:flutter/material.dart';
import 'package:pricer/Features/home/presentation/views/widgets/project_item.dart';

class ProjectsGridDone extends StatelessWidget {
  const ProjectsGridDone({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
        itemCount: 4,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 10),
        itemBuilder: ((context, index) {
          return const ProjectItem(
            iconData: Icons.task_alt,
          );
        }));
  }
}
