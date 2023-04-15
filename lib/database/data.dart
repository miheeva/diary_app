import 'dart:convert';
import 'package:sqflite/sqflite.dart';
import 'package:diary_app/note/parser.dart';
import 'package:diary_app/utils/assets.dart';

class DatabaseTables {

  final Database _db;

  DatabaseTables(this._db);

  Future<void> deploy() {
    return Future.wait([
      _deployDiaryNote(),
      _deployFixtures()
    ]);
  }

  Future<void>  _deployFixtures() async {
    var rawData = await AssetManager().load('assets/data/result.json');
    _deployNotes(rawData);
  }

  void _deployNotes(String rawData) {
    final items = jsonDecode(rawData);
    var parser = DiaryNoteParser();
    final models = parser.parse(items);
    models.forEach((element) {
      _db.insert('DiaryNote', element);
    });
  }
  
  Future<void> _deployDiaryNote() {
    return _db.execute("""
      CREATE TABLE "DiaryNote" (
          id INTEGER PRIMARY KEY,
          "createdAt" DATE_TIME,
          date DATE_TIME,
          label TEXT,
          content TEXT,
          additional ARRAY[TEXT]
          );
        """
          );
  }
}
