import 'package:diary_app/database/data.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';


class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();

  late Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await _init();
    return _database;

  }


  Future<Database> _init() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'diary_app.db');
    return await openDatabase(path, version: 1, onCreate: (Database db, int version) async {
      var dbTables = DatabaseTables(db);
      // await dbTables.deploy();
      // await dbTables.deployFixtures();
    });
  }
}
