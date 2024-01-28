import 'package:pricer/core/models/project_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
//import 'package:sqflite_common/sqlite_api.dart';

class DatabaseHelper {
  late Database _database;

//
  Future<void> initializeDatabase() async {
    // Open the database and create tables if not exists
    /* sqflite_ffi.sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
 */
    _database = await openDatabase(
      join(await getDatabasesPath(), 'my_projects.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE projects(id INTEGER PRIMARY KEY, status TEXT, projectName TEXT, clientName TEXT, totalPrice REAL, pricePerHour REAL, hours REAL,minutes REAL)',
        );
      },
      version: 1,
    );

    /* 

    // Delete the database file
    closeDatabase();
    await deleteDatabase(
      join(await getDatabasesPath(), 'my_projects.db'),
    ); */
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
        hours: maps[index]['hours'],
        minutes: maps[index]['minutes'],
        pricePerHour: maps[index]['pricePerHour'],
      );
    });
  }

  //

  Future<void> updateData(ProjectModel model) async {
    await _database.update(
      'projects',
      model.toMap(),
      where: 'id = ?',
      whereArgs: [model.id],
    );
  }

//

  Future<void> deleteModel(int id) async {
    await _database.delete(
      'projects',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  //

  Future<int> getLastInsertedId() async {
    List<Map<String, dynamic>> result = await _database.rawQuery(
      'SELECT MAX(id) as max_id FROM projects',
    );

    int lastId = result.isNotEmpty ? result.first['max_id'] ?? 0 : 0;
    return lastId;
  }

  void closeDatabase() {
    _database.close();
  }
}
