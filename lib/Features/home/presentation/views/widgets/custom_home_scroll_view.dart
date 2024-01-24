import 'package:flutter/material.dart';
import 'package:pricer/Features/home/presentation/views/widgets/custom_search_box.dart';
import 'package:pricer/Features/home/presentation/views/widgets/done_row.dart';
import 'package:pricer/Features/home/presentation/views/widgets/pending_row.dart';
import 'package:pricer/Features/home/presentation/views/widgets/project_grid_done.dart';
import 'package:pricer/Features/home/presentation/views/widgets/project_grid_pending.dart';

class CustomHomeScrollView extends StatelessWidget {
  const CustomHomeScrollView({
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
            height: 32,
          ),
        ),
        ProjectsGridPending(),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 20,
          ),
        ),
        SliverToBoxAdapter(
          child: DoneRow(),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 30,
          ),
        ),
        ProjectsGridDone(),
      ],
    );
  }
}
