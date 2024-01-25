import 'package:flutter/material.dart';
import 'package:pricer/core/widgets/custom_search_box.dart';
import 'package:pricer/core/widgets/done_row.dart';
import 'package:pricer/core/widgets/project_grid_done.dart';

class CustomDoneProjectsScrollView extends StatelessWidget {
  const CustomDoneProjectsScrollView({
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
