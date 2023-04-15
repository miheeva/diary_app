abstract class ModelAdapter<T> {
  Map<String, dynamic> toMap(T model);
  T fromMap(Map<String, dynamic> map);
  List<T> fromList(List<Map<String, dynamic>> list) {
    return list.map((Map<String, dynamic> item) => fromMap(item)).toList();
  }
}

abstract class Model {
  late int id;
}
