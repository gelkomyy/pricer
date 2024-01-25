import 'package:flutter/material.dart';
import 'package:pricer/Features/completed_projects/presentation/views/widgets/completed_projects_view_body.dart';

class CompletedProjectsView extends StatelessWidget {
  const CompletedProjectsView({super.key});
  static String id = 'CompletedProjectsView';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: CompletedProjectsViewBody()),
    );
  }
}
