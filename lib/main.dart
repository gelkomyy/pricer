import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pricer/Features/completed_projects/presentation/views/completed_projects_view.dart';
import 'package:pricer/Features/home/presentation/manager/manage_database_projects_cubit/manage_projects_cubit.dart';
import 'package:pricer/Features/home/presentation/views/home_view.dart';
import 'package:pricer/Features/pending_projects/presentation/views/pending_projects_view.dart';
import 'package:pricer/constans.dart';
import 'package:pricer/core/utils/custom_bloc_observer.dart';

void main() {
  runApp(const PricerApp());
  Bloc.observer = CustomBlocObserver();
}

class PricerApp extends StatelessWidget {
  const PricerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ManageProjectsCubit(),
      child: MaterialApp(
        initialRoute: '/home',
        routes: {
          '/home': (context) => const HomeView(),
          CompletedProjectsView.id: (context) => const CompletedProjectsView(),
          PendingProjectsView.id: (context) => const PendingProjectsView(),
        },
        debugShowCheckedModeBanner: false,
        theme:
            ThemeData.dark().copyWith(scaffoldBackgroundColor: kPrimaryColor),
        home: const HomeView(),
      ),
    );
  }
}
