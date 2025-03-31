import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/user.dart';

class DBHelper {
  static Future<Database> initializeDB() async {
    String path = join(await getDatabasesPath(), 'app_data.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        db.execute(
          "CREATE TABLE users(id INTEGER PRIMARY KEY, name TEXT, surname TEXT, email TEXT, password TEXT, isSynced INTEGER DEFAULT 0)",
        );
      },
    );
  }

  static Future<void> insertUser(UserModel user) async {
    final db = await initializeDB();
    await db.insert('users', user.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }
  // ✅ Fetch all users from local database
  static Future<List<UserModel>> fetchUsers() async {
    final db = await initializeDB();
    final result = await db.query('users');
    return result.map((map) => UserModel.fromMap(map)).toList();
  }

  // ✅ Mark ONLY the last unsynced entry as synced
  static Future<void> updateUserAsSynced(int id) async {
    final db = await initializeDB();
    await db.update(
      'users',
      {'isSynced': 1},
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
