import 'package:sqflite/sqflite.dart';

class DatabaseTables {

  final Database _db;

  DatabaseTables(this._db);

  Future<void> deploy() {
    return Future.wait([
      _deployColored(),
      _deployMoodType()
    ]);
  }

  // Future<void> deployFixtures() {
  //   return Future.wait([
  //     _db.insert('MoodTypes', {'id': 1, 'name': 'joy', 'color': '#34eb6e'}),
  //     _db.insert('MoodTypes', {'id': 2, 'name': 'angry', 'color': '#C70000'})
  //   ]);
  // }
  
  Future<void> _deployColored() {
    return _db.execute("""
    CREATE TABLE DiaryNote (
          id INTEGER PRIMARY KEY,
          createdAt
          date TEXT,
          moodType INTEGER,
          label TEXT,
          description TEXT,
          FOREIGN KEY(moodType) REFERENCES MoodTypes(id))"""
          );
  }

  Future<void> _deployMoodType() {
    return _db.execute("CREATE TABLE MoodTypes ("
          "id INTEGER PRIMARY KEY,"
          "name TEXT,"
          "color TEXT"
          ")");
  }

}
