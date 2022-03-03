import 'package:sqflite/sqflite.dart' as sql;

import 'package:path/path.dart' as path;

class DBHelper {
  static Future<sql.Database> openDB() async {
    final dir = await sql.getDatabasesPath();

    return sql.openDatabase(path.join(dir, 'pt.db'), onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE prayer_times(id TEXT PRIMARY KEY, date TEXT, fajr TEXT, sunrise TEXT, duhur TEXT, asr TEXT, sunset TEXT, maghrep TEXT, isha TEXT, fajrTime TEXT, duhurTime TEXT, asrTime TEXT, maghrepTime TEXT, ishaTime TEXT)');
    }, version: 1);
  }

  static Future<int>? insertToDB(
      String table, Map<String, dynamic> data) async {
    var db = await DBHelper.openDB();
    return await db.insert(table, data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> dbQuery() async {
    var db = await DBHelper.openDB();
    return await db.query('prayer_times');
  }
}
