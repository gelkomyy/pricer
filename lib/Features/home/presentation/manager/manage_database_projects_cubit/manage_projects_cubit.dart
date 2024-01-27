import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:meta/meta.dart';
import 'package:pricer/core/models/project_model.dart';
import 'package:pricer/core/utils/database_helper.dart';

part 'manage_projects_state.dart';

class ManageProjectsCubit extends Cubit<ManageProjectsState> {
  ManageProjectsCubit() : super(ManageProjectsInitial());
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<ProjectModel> projects = [];

  Future<void> getAllProjects() async {
    projects = await databaseHelper.getAllData();
    emit(GetProjectsDone());
  }

  Future<void> initializeDatabase() async {
    emit(GetProjectsLoading());
    await databaseHelper.initializeDatabase();
    await getAllProjects();
    emit(GetProjectsDone());
  }

  Future<void> addProject(ProjectModel model) async {
    try {
      emit(AddProjectLoading());
      await databaseHelper.insertData(model);
      emit(AddProjectDone());
      await getAllProjects();
      emit(GetProjectsDone());
    } catch (e) {
      emit(AddProjectFailed());
    }
  }

  Future<void> editProject(ProjectModel model) async {
    try {
      emit(EditProjectLoading());
      await databaseHelper.updateData(model);
      emit(EditProjectDone());
      await getAllProjects();
      emit(GetProjectsDone());
    } catch (e) {
      emit(EditProjectFailed());
    }
  }

  Future<int> getLastInsertedId() async {
    return await databaseHelper.getLastInsertedId();
  }
}
