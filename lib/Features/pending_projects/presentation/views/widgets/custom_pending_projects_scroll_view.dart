import 'package:flutter/material.dart';
import 'package:pricer/Features/home/presentation/views/widgets/custom_search_box.dart';
import 'package:pricer/Features/home/presentation/views/widgets/pending_row.dart';
import 'package:pricer/Features/home/presentation/views/widgets/project_grid_pending.dart';

class CustomPendingProjectsScrollView extends StatelessWidget {
  const CustomPendingProjectsScrollView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: CustomSearchBox(),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 20,
          ),
        ),
        SliverToBoxAdapter(
          child: PendingRow(),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 30,
          ),
        ),
        ProjectsGridPending(),
      ],
    );
  }
}
