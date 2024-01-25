import 'package:flutter/material.dart';
import 'package:pricer/Features/pending_projects/presentation/views/widgets/pending_projects_view_body.dart';

class PendingProjectsView extends StatelessWidget {
  const PendingProjectsView({super.key});
  static String id = 'PendingProjectsView';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: PendingProjectsViewBody()),
    );
  }
}
