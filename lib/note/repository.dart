import 'package:diary_app/repository/repository.dart';
import 'package:diary_app/repository/model.dart';

class DiaryModel implements Model {
  int id;
  DateTime createdAt;
  DateTime date;
  String label;
  String content;
  List<String> additional;

  DiaryModel(this.id, this.date, this.createdAt, this.label, this.content, this.additional);
}

class DiaryAdapter extends ModelAdapter<DiaryModel> {
  
  @override
  Map<String, dynamic> toMap(DiaryModel model) {
    return {
      "id": model.id,
      "createdAt": model.createdAt,
      "date": model.date,
      "label": model.label,
      "content": model.content,
      "additional": model.additional
    };
  }

  @override
  DiaryModel fromMap(Map<String, dynamic> map) {
    int id = map['id'] as int;
    DateTime date = map['date'] != null ? DateTime.parse(map['date']) : DateTime.now();
    DateTime createdAt = map['createdAt'] != null ? DateTime.parse(map['createdAt']) : DateTime.now();
    String label = map['label'] as String;
    String content = map['content'] as String;
    // List<String> additional = map['additional'] as List<String>;
    return DiaryModel(id, createdAt, date, label, content, []);
  }
}

class DiaryNoteRepository extends TableRepository<DiaryModel> {
  @override
  final String tableName = 'DiaryNote';

  @override
  ModelAdapter<DiaryModel> get adapter => DiaryAdapter();
}
