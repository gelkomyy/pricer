import 'package:flutter/material.dart';
import 'package:pricer/Features/completed_projects/presentation/views/widgets/custom_done_projects_scroll_view.dart';

class CompletedProjectsViewBody extends StatelessWidget {
  const CompletedProjectsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: CustomDoneProjectsScrollView(),
    );
  }
}
