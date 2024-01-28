import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pricer/Features/home/presentation/manager/manage_database_projects_cubit/manage_projects_cubit.dart';
import 'package:pricer/Features/home/presentation/views/widgets/custom_add_floating_butoon.dart';
import 'package:pricer/Features/home/presentation/views/widgets/custom_home_scroll_view.dart';
import 'package:pricer/core/widgets/loading_overlay_blured.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ManageProjectsCubit>(context).initializeDatabase();
    Future.delayed(const Duration(seconds: 3), () {
      // After 3 seconds, update the isLoading state
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageProjectsCubit, ManageProjectsState>(
      /*  listener: (context, state) {
        if (state is ManageProjectsInitial) {
          BlocProvider.of<ManageProjectsCubit>(context).initializeDatabase();
        }
      }, */
      builder: (context, state) {
        return LoadingOverlay(
          isLoading: isLoading || state is GetProjectsLoading,
          child: const Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: CustomHomeScrollView(),
              ),
              CustomAddFloatingButton(),
            ],
          ),
        );

        /* return const Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: CustomHomeScrollView(),
            ),
            CustomAddFloatingButton(),
          ],
        ); */
      },
    );
  }
}
