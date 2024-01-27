import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pricer/Features/home/presentation/manager/manage_database_projects_cubit/manage_projects_cubit.dart';
import 'package:pricer/core/widgets/custom_search_box.dart';
import 'package:pricer/core/widgets/done_row.dart';
import 'package:pricer/core/widgets/pending_row.dart';
import 'package:pricer/core/widgets/project_grid_done.dart';
import 'package:pricer/core/widgets/project_grid_pending.dart';

class CustomHomeScrollView extends StatelessWidget {
  const CustomHomeScrollView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: BlocProvider.of<ManageProjectsCubit>(context).getAllProjects(),
      builder: (context, snapshot) {
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
      },
    );
  }
}
