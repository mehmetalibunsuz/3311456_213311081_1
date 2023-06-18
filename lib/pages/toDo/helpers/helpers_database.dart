import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._();

  static Database? _database;

  DatabaseHelper._();

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }

    _database = await _initDatabase();
    return _database;
  }

  Future<Database> _initDatabase() async {
    final String path = await getDatabasesPath();
    final String dbPath = join(path, 'todo.db');

    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE todo(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        taskName TEXT,
        taskCompleted INTEGER
      )
    ''');
  }

  Future<List<Map<String, dynamic>>> getTasks() async {
    final Database? db = await instance.database;
    return await db!.query('todo');
  }

  Future<int> insertTask(String taskName, bool taskCompleted) async {
    final db = await database;
    return await db!.insert(
      'todo',
      {'taskName': taskName, 'taskCompleted': taskCompleted ? 1 : 0},
    );
  }

  Future<void> updateTask(int id, bool taskCompleted) async {
    final db = await database;
    await db!.update(
      'todo',
      {'taskCompleted': taskCompleted ? 1 : 0},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteTask(int id) async {
    final db = await database;
    await db!.delete(
      'todo',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
