import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pricer/core/models/project_model.dart';
import 'package:pricer/core/utils/database_helper.dart';

part 'manage_projects_state.dart';

class ManageProjectsCubit extends Cubit<ManageProjectsState> {
  ManageProjectsCubit() : super(ManageProjectsInitial());
  DatabaseHelper databaseHelper = DatabaseHelper();

  Future<void> initializeDatabase() async {
    await databaseHelper.initializeDatabase();
  }

  Future<void> addProject(ProjectModel model) async {
    try {
      emit(AddProjectLoading());
      await databaseHelper.insertData(model);
      emit(AddProjectDone());
    } catch (e) {
      emit(AddProjectFailed());
    }
  }

  Future<void> editProject(ProjectModel model) async {
    try {
      emit(EditProjectLoading());
      await databaseHelper.updateData(model);
      emit(EditProjectDone());
    } catch (e) {
      emit(EditProjectFailed());
    }
  }

  Future<List<ProjectModel>> getAllProjects() async {
    return await databaseHelper.getAllData();
  }
}
