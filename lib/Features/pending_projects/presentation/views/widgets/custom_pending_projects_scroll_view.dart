import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pricer/Features/home/presentation/manager/manage_database_projects_cubit/manage_projects_cubit.dart';
import 'package:pricer/core/widgets/custom_search_box.dart';
import 'package:pricer/core/widgets/pending_row.dart';
import 'package:pricer/core/widgets/project_grid_pending.dart';

class CustomPendingProjectsScrollView extends StatefulWidget {
  const CustomPendingProjectsScrollView({
    super.key,
  });

  @override
  State<CustomPendingProjectsScrollView> createState() =>
      _CustomPendingProjectsScrollViewState();
}

class _CustomPendingProjectsScrollViewState
    extends State<CustomPendingProjectsScrollView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ManageProjectsCubit>(context).initializeDatabase();
  }

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
