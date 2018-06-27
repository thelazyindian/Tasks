import 'dart:async';
import 'dart:io' as io;

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tasks/model/task.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  DatabaseHelper.internal();

  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  static DatabaseHelper get() {
    return _instance;
  }

  initDb() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "task.db");
    var ourDb = await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
    return ourDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE Task(id INTEGER PRIMARY KEY, task TEXT, status TEXT)");
    print("Table is created");
  }

  Future<int> saveTask(Task task) async {
    var dbClient = await db;
    int res = await dbClient.insert("Task", task.toMap());
    return res;
  }

  Future<int> deleteTableTask(Task task) async {
    var dbClient = await db;
    int res = await dbClient.delete("Task");
    return res;
  }

  Future deleteTask(int taskId) async {
    var dbClient = await db;
    await dbClient.transaction((Transaction txn) async {
      await txn.rawDelete('DELETE FROM Task WHERE "id" = \'$taskId\'');
    });
  }

  Future updateTask(String task) async {
    var dbClient = await db;
    await dbClient.transaction((Transaction txn) async {
      await txn.rawUpdate(
          'UPDATE "Task" SET "status" = \'COMPLETED\' WHERE "task" = \'$task\';');
    });
  }

  Future<List<Task>> getTasks(String status) async {
    var dbClient = await db;
    List<Map<String, dynamic>> result = await dbClient
        .rawQuery('SELECT "task" from "Task" WHERE "status" = \'$status\'');
    print('SELECT "task" from "Task" WHERE "status" = \'$status\'');

    List<Task> tasks = new List();
    for (Map<String, dynamic> item in result) {
      var myTask = new Task.fromMap(item);
      tasks.add(myTask);
    }
    return tasks;
  }

  Future close() async => _db.close();
}
