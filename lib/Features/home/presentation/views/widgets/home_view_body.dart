import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pricer/Features/home/presentation/manager/manage_database_projects_cubit/manage_projects_cubit.dart';
import 'package:pricer/Features/home/presentation/views/widgets/custom_add_floating_butoon.dart';
import 'package:pricer/Features/home/presentation/views/widgets/custom_home_scroll_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:
          BlocProvider.of<ManageProjectsCubit>(context).initializeDatabase(),
      builder: (context, snapshot) {
        return const Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: CustomHomeScrollView(),
            ),
            CustomAddFloatingButton(),
          ],
        );
      },
    );
  }
}
