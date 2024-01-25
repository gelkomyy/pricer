import 'package:flutter/material.dart';
import 'package:pricer/core/utils/check_screen_view.dart';
import 'package:pricer/core/widgets/project_item.dart';

class ProjectsGridPending extends StatelessWidget {
  const ProjectsGridPending({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
        itemCount: isPendingView(context) ? 10 : 4,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 10),
        itemBuilder: ((context, index) {
          return const ProjectItem();
        }));
  }
}
