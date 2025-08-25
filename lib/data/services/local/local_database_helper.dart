import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

class LocalDatabaseHelper {
  static Future<void> createTables(sql.Database database) async {
    Batch batch = database.batch();

    batch.execute("""
      CREATE TABLE IF NOT EXISTS chatgroups(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        description TEXT,
        owerId TEXT
      )
    """);

    await batch.commit();
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'chat.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
      onUpgrade: (sql.Database database, int oldVersion, int newVersion) async {
        await createTables(database);
      },
    );
  }
}
