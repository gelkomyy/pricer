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
    emit(GetProjectsLoading());
    projects = await databaseHelper.getAllData();
    emit(GetProjectsDone());
  }

  Future<void> initializeDatabase() async {
    await databaseHelper.initializeDatabase();
    await getAllProjects();
  }

  Future<void> addProject(ProjectModel model) async {
    try {
      emit(AddProjectLoading());
      await databaseHelper.insertData(model);
      emit(AddProjectDone());
      await getAllProjects();
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
    } catch (e) {
      emit(EditProjectFailed());
    }
  }

  Future<int> getLastInsertedId() async {
    return await databaseHelper.getLastInsertedId();
  }

  Future<void> deleteModel(int id) async {
    await databaseHelper.deleteModel(id);
    await getAllProjects();
  }
}
