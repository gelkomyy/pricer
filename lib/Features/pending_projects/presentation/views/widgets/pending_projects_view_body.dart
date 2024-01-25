import 'package:flutter/material.dart';
import 'package:pricer/Features/pending_projects/presentation/views/widgets/custom_pending_projects_scroll_view.dart';

class PendingProjectsViewBody extends StatelessWidget {
  const PendingProjectsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: CustomPendingProjectsScrollView(),
    );
  }
}
