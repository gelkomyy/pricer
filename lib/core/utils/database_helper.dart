import 'package:pricer/core/models/project_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  late Database _database;

//
  Future<void> initializeDatabase() async {
    // Open the database and create tables if not exists
    _database = await openDatabase(
      join(await getDatabasesPath(), 'my_projects.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE projects(id INTEGER PRIMARY KEY, status TEXT, projectName TEXT, clientName TEXT, totalPrice REAL, totalHours REAL)',
        );
      },
      version: 1,
    );
  }

  //

  Future<void> insertData(ProjectModel model) async {
    // Insert data into the table
    await _database.insert(
      'projects',
      model.toMap(), // Convert your model to a map
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  //
  Future<List<ProjectModel>> getAllData() async {
    final List<Map<String, dynamic>> maps = await _database.query('projects');

    // Convert List<Map<String, dynamic>> to List<YourModel>
    return List.generate(maps.length, (index) {
      return ProjectModel(
        id: maps[index]['id'],
        status: maps[index]['status'],
        projectName: maps[index]['projectName'],
        clientName: maps[index]['clientName'],
        totalPrice: maps[index]['totalPrice'],
        totalHours: maps[index]['totalHours'],
      );
    });
  }
}
