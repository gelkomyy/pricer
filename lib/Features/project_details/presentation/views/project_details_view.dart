import 'package:flutter/material.dart';
import 'package:pricer/Features/project_details/presentation/views/widgets/project_details_view_body.dart';
import 'package:pricer/constans.dart';

class ProjectDetailsView extends StatelessWidget {
  const ProjectDetailsView({super.key});
  static String id = 'ProjectDetailsView';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kPrimaryColor,
      body: SafeArea(child: ProjectDetailsViewBody()),
    );
  }
}
