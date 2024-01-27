part of 'manage_projects_cubit.dart';

@immutable
sealed class ManageProjectsState {}

final class ManageProjectsInitial extends ManageProjectsState {}

final class AddProjectInitial extends ManageProjectsState {}

final class GetProjectsDone extends ManageProjectsState {}

final class AddProjectLoading extends ManageProjectsState {}

final class AddProjectDone extends ManageProjectsState {}

final class AddProjectFailed extends ManageProjectsState {}

final class EditProjectInitial extends ManageProjectsState {}

final class EditProjectLoading extends ManageProjectsState {}

final class EditProjectDone extends ManageProjectsState {}

final class EditProjectFailed extends ManageProjectsState {}
