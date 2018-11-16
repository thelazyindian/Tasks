// import 'dart:async';
// import 'dart:io' as io;

// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';

// import '../model/task.dart';

// class DatabaseHelper {
//   static final DatabaseHelper _instance = DatabaseHelper.internal();

//   factory DatabaseHelper() => _instance;

//   DatabaseHelper.internal();

//   static Database _db;
//   String _dbFileName = "task.db";
//   String _tableName = "My Tasks";
//   String _columnId = "id";
//   String _columnTask = "task";
//   String _columnStatus = "status";
//   String _columnDetails = "details";
//   String _columnDate = "date";

//   Future<Database> get db async {
//     if (_db != null) {
//       return _db;
//     }
//     _db = await initDb();
//     return _db;
//   }

//   static DatabaseHelper get() {
//     return _instance;
//   }

//   initDb() async {
//     print("Tasks: Running initDb");
//     io.Directory documentDirectory = await getApplicationDocumentsDirectory();
//     String path = join(documentDirectory.path, _dbFileName);
//     var ourDb = await openDatabase(
//       path,
//       version: 1,
//       onCreate: _onCreate,
//     );
//     return ourDb;
//   }

//   void _onCreate(Database db, int version) async {
//     await db.execute(
//         "CREATE TABLE '$_tableName' ($_columnId INTEGER PRIMARY KEY, $_columnTask TEXT, $_columnStatus TEXT, $_columnDetails TEXT, $_columnDate TEXT)");
//     print("Table $_tableName is created");
//   }

//   Future<List<String>> getTables() async {
//     var dbClient = await db;
//     List<Map<String, dynamic>> tables = await dbClient
//         .rawQuery("SELECT * FROM sqlite_master WHERE type=\'table\';");

//     List<String> tableNames = List();
//     if (tables != null) {
//       for (Map<String, dynamic> item in tables) {
//         if (item['name'] != "android_metadata") {
//           tableNames.add(item['name']);
//         }
//       }
//     }
//     return tableNames;
//   }

//   Future createTable(String _newTableName) async {
//     var dbClient = await db;
//     await dbClient.transaction((Transaction txn) {
//       txn.rawQuery(
//           "CREATE TABLE '$_newTableName' ($_columnId INTEGER PRIMARY KEY,"
//           " $_columnTask TEXT, $_columnStatus TEXT,"
//           " $_columnDetails TEXT, $_columnDate TEXT)");
//     });
//     print("Created table with name: $_newTableName");
//   }

//   Future renameTable(String _oldTableName, String _newTableName) async {
//     var dbClient = await db;
//     await dbClient.transaction((Transaction txn) {
//       txn.rawQuery(
//           "ALTER TABLE \'$_oldTableName\' RENAME TO \'$_newTableName\';");
//     });
//   }

//   Future deleteTable(String tblName) async {
//     var dbClient = await db;
//     await dbClient.transaction((Transaction txn) {
//       txn.rawQuery("DROP TABLE \'$tblName\'");
//     });
//   }

//   Future saveTask(Task task, String tblName) async {
//     var dbClient = await db;
//     await dbClient.transaction((Transaction txn) async {
//       txn.insert("\'$tblName\'", task.toMap());
//     });
//   }

//   Future deleteTableTask(Task task, String tblName) async {
//     var dbClient = await db;
//     await dbClient.transaction((Transaction txn) async {
//       txn.delete(tblName);
//     });
//   }

//   Future deleteTask(int taskId, String tblName) async {
//     var dbClient = await db;
//     await dbClient.transaction((Transaction txn) async {
//       await txn
//           .rawDelete('DELETE FROM \'$tblName\' WHERE $_columnId = \'$taskId\'');
//     });
//   }

//   Future deleteCompletedTask(String tblName) async {
//     var dbClient = await db;
//     await dbClient.transaction((Transaction txn) async {
//       await txn.rawDelete(
//           'DELETE FROM \'$tblName\' WHERE $_columnStatus = \'COMPLETED\';');
//     });
//   }

//   Future updateTask(String task, String tblName) async {
//     var dbClient = await db;
//     await dbClient.transaction((Transaction txn) async {
//       await txn.rawUpdate(
//           'UPDATE \'$tblName\' SET $_columnStatus = \'COMPLETED\' WHERE $_columnTask = \'$task\';');
//     });
//   }

//   Future updateDateByID(int taskId, String taskDate, String tblName) async {
//     var dbClient = await db;
//     await dbClient.transaction((Transaction txn) async {
//       print("Date Update to: $taskDate for task id: $taskId");
//       await txn.rawUpdate(
//           'UPDATE \'$tblName\' SET $_columnDate = \'$taskDate\' WHERE $_columnId = \'$taskId\';');
//     });
//   }

//   Future updateDetailsByID(
//       int taskId, String task, String details, String tblName) async {
//     var dbClient = await db;

//     print("Id: $taskId Task: $task Details: $details");

//     if (details != null) {
//       await dbClient.transaction((Transaction txn) async {
//         print("Details Update to: $details for task id: $taskId");
//         await txn.rawUpdate(
//             'UPDATE \'$tblName\' SET $_columnDetails = \'$details\' WHERE $_columnId = \'$taskId\';');
//       });
//     } else if (details == null) {
//       await dbClient.transaction((Transaction txn) async {
//         print("Details Update to: $details for task id: $taskId");
//         await txn.rawUpdate(
//             'UPDATE \'$tblName\' SET $_columnDetails = null WHERE $_columnId = \'$taskId\';');
//       });
//     }

//     if (task != null) {
//       await dbClient.transaction((Transaction txn) async {
//         print("Task Update to: $task for task id: $taskId");
//         await txn.rawUpdate(
//             'UPDATE \'$tblName\' SET $_columnTask = \'$task\' WHERE $_columnId = \'$taskId\';');
//       });
//     } else if (task == null) {
//       await dbClient.transaction((Transaction txn) async {
//         print("Task Update to: $task for task id: $taskId");
//         await txn.rawUpdate(
//             'UPDATE \'$tblName\' SET $_columnTask = null WHERE $_columnId = \'$taskId\';');
//       });
//     }
//   }

//   Future<List<Task>> getTasksByStatus(String tblName, String status) async {
//     var dbClient = await db;
//     List<Map<String, dynamic>> result = await dbClient.rawQuery(
//         'SELECT * FROM \'$tblName\' WHERE $_columnStatus = \'$status\'');

//     List<Task> tasks = List();
//     for (Map<String, dynamic> item in result) {
//       var myTask = Task.fromMap(item);
//       tasks.add(myTask);
//     }
//     return tasks;
//   }

//   Future<Task> getTaskById(String tblName, int id) async {
//     var dbClient = await db;
//     List<Map<String, dynamic>> result = await dbClient
//         .rawQuery('SELECT * FROM \'$tblName\' WHERE $_columnId = \'$id\'');

//     Task task;
//     for (Map<String, dynamic> item in result) {
//       task = Task.fromMap(item);
//       print("DatabaseHelper: ${task.task}");
//     }

//     return task;
//   }

//   Future close() async => _db.close();
// }

// -- Get Tasks --
// print("Running _getTasks()");
// if (listName != null && listName != "") {
//   var dbClient = DatabaseHelper();
//   dbClient.getTasksByStatus(listName, "PENDING").then((tasks) {
//     if (tasks == null) return;
//     setState(() {
//       pendingTaskList.clear();
//       pendingTaskList.addAll(tasks);
//       //print(tasks.toString());
//     });
//   });

//   dbClient.getTasksByStatus(listName, "COMPLETED").then((tasks) {
//     if (tasks == null) return;
//     setState(() {
//       completedTaskList.clear();
//       completedTaskList.addAll(tasks);
//       //print(tasks.toString());
//     });
//   });
// } else {
//   print("var listName is null");
// }

// -- Get Tables --
// DatabaseHelper.get().getTables().then((tableNames) {
//   if (tableNames != null) {
//     tblNames.clear();
//     for (String item in tableNames) {
//       setState(() {
//         print(item);
//         tblNames.add(item);
//       });
//     }
//     activeList = tblNames[0];
//     listName = tblNames[0];
//     defaultListName = tblNames[0];
//     _getTasks();
//   } else
//     print("getTables returned null");
// });

// -- Delete List --
// await DatabaseHelper.get().deleteTable(activeList);

// -- Delete COmpleted Tasks
// await DatabaseHelper.get().deleteCompletedTask(activeList);

// -- Task Save --
// var db = DatabaseHelper();
// db.saveTask(task, activeList);
// //Navigator.pop(context);

// -- Update Task --
// var db = DatabaseHelper();
// db.updateTask(task, activeList);

// -- Add List --
// await DatabaseHelper.get()
//     .createTable(newListTitle)
//     .then((_) {
//   Navigator.pop(context);
// });

// -- Rename List --
// await DatabaseHelper.get()
//     .renameTable(oldListTitle, newListTitle)
//     .then((_) {
//   Navigator.pop(context);
// });
