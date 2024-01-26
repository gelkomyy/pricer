import 'package:flutter/material.dart';
import 'package:pricer/Features/completed_projects/presentation/views/completed_projects_view.dart';
import 'package:pricer/Features/home/presentation/views/home_view.dart';
import 'package:pricer/Features/pending_projects/presentation/views/pending_projects_view.dart';
import 'package:pricer/Features/project_details/presentation/views/project_details_view.dart';
import 'package:pricer/constans.dart';

void main() {
  runApp(const PricerApp());
}

class PricerApp extends StatelessWidget {
  const PricerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomeView(),
        CompletedProjectsView.id: (context) => const CompletedProjectsView(),
        PendingProjectsView.id: (context) => const PendingProjectsView(),
        ProjectDetailsView.id: (context) => const ProjectDetailsView(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: kPrimaryColor),
      home: const HomeView(),
    );
  }
}
