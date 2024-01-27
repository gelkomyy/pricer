import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pricer/Features/home/presentation/manager/manage_database_projects_cubit/manage_projects_cubit.dart';
import 'package:pricer/core/widgets/custom_search_box.dart';
import 'package:pricer/core/widgets/done_row.dart';
import 'package:pricer/core/widgets/project_grid_done.dart';

class CustomDoneProjectsScrollView extends StatefulWidget {
  const CustomDoneProjectsScrollView({
    super.key,
  });

  @override
  State<CustomDoneProjectsScrollView> createState() =>
      _CustomDoneProjectsScrollViewState();
}

class _CustomDoneProjectsScrollViewState
    extends State<CustomDoneProjectsScrollView> {
  @override
  void initState() {
    // TODO: implement initState
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
