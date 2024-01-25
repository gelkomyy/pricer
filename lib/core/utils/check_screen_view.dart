import 'package:flutter/material.dart';
import 'package:pricer/Features/completed_projects/presentation/views/completed_projects_view.dart';
import 'package:pricer/Features/pending_projects/presentation/views/pending_projects_view.dart';

bool isHomeView(BuildContext context) {
  return ModalRoute.of(context)?.settings.name == '/home';
}

bool isCompletedView(BuildContext context) {
  return ModalRoute.of(context)?.settings.name == CompletedProjectsView.id;
}

bool isPendingView(BuildContext context) {
  return ModalRoute.of(context)?.settings.name == PendingProjectsView.id;
}
