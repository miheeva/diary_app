import 'repository.dart' show DiaryModel;

class DiaryNoteParser {
  List<Map<String, dynamic>> parse(List<dynamic> data) {
    return data.asMap().entries.map((item) {
      var inx = item.key;
      var value = item.value;
      var parsedDate = value['parsed_date'] ?? DateTime.now();
      return {
        'id': inx,
        'createdAt': DateTime.now().toIso8601String(),
        'date': value['parsed_date'],
        'label': value['title'],
        'content': value['content'],
        'additional': value['additional']
      };
    }).toList();
  }
}
