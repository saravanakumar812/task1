import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;

//Create database and table
class DatabaseHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE items(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        name TEXT,
        email TEXT,
        password NUMBER,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);
  }
// id: the id of item
// title, description: name and description of your activity
// created_at: the time that the item was created. It will be automatically handled by SQLite

  //open the database
  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'code.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  // Create new item
  //takes two parameters one is the title and the other is the description
  static Future<int> createItem(
      String? name, String? email, String? password) async {
    final db = await DatabaseHelper.db();

    final data = {'name': name, 'email': email, 'password': password};
    final id = await db.insert('items', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  // Read all items
  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await DatabaseHelper.db();
    return db.query('items', orderBy: "id");
  }

  // Update an item by id
  static Future<int> updateItem(
      int id, String name, String? email, String password) async {
    final db = await DatabaseHelper.db();

    final data = {
      'name': name,
      'email': email,
      'password': password,
      'createdAt': DateTime.now().toString()
    };

    final result =
        await db.update('items', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  // Delete
  static Future<void> deleteItem(int id) async {
    final db = await DatabaseHelper.db();
    try {
      await db.delete("items", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}
