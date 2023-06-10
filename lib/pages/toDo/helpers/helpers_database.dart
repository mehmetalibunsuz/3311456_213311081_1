import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDatabase();
    return _database!;
  }

  DatabaseHelper.internal();

  Future<Database> initDatabase() async {
    final path = join(await getDatabasesPath(), 'todo.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE todo (
            id INTEGER PRIMARY KEY,
            taskName TEXT,
            taskCompleted INTEGER
          )
        ''');
      },
    );
  }

  Future<List<Map<String, dynamic>>> getToDoList() async {
    final db = await database;
    return await db.query('todo');
  }

  Future<int> insertTask(String taskName, int taskCompleted) async {
    final db = await database;
    return await db.insert('todo', {'taskName': taskName, 'taskCompleted': taskCompleted});
  }

  Future<int> updateTask(int id, int taskCompleted) async {
    final db = await database;
    return await db.update('todo', {'taskCompleted': taskCompleted}, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteTask(int id) async {
    final db = await database;
    return await db.delete('todo', where: 'id = ?', whereArgs: [id]);
  }
}
