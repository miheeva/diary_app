import 'package:diary_app/database/provider.dart';
import 'package:diary_app/repository/model.dart';


class RepositoryError implements Exception {
  String cause;
  RepositoryError(this.cause);
}

class EntityNotFoundError extends RepositoryError {
  EntityNotFoundError(String cause) : super(cause);
}

abstract class Repository<T> {
  Future<List<T>> list();
  Future<List<T>> query(Map<String, dynamic> params);
  Future<T> get(int id);
  // Future<T> getOrNone(int id);
  Future<int> delete(int id);
  Future<int> update(T model);
  Future<int> create(T model);
  Future<int> upsert(T model);
}

abstract class WithId {
  late int id;
}

class TableRepository<T extends Model> implements Repository<T> {
  late String tableName;
  String idField = 'id';
  late ModelAdapter<T> adapter;
  DBProvider dbProvider = DBProvider.db;

  

  @override
  Future<int> delete(int id) async {
    var db = await dbProvider.database;
    return db.delete(tableName, where: '$idField = ?', whereArgs: [id]);
  }

  @override
  Future<T> get(int id) async {
    var db = await dbProvider.database;
    var models = await db.query(tableName, where: '$idField = ?', whereArgs: [id]);
    if (models.isEmpty) {
      throw EntityNotFoundError('Model with primary key ($idField) $id not found in table $tableName');
    }
    return adapter.fromMap(models.first);
  }

  // @override
  // Future<T> getOrNone(int id) async {
  //   T model;
  //   try {
  //     model = await this.get(id);
  //   } on EntityNotFoundError {}
  //   return model;
  // }

  @override
  Future<List<T>> list() async {
    var db = await dbProvider.database;
    return adapter.fromList(await db.query(tableName));
  }

  @override
  Future<List<T>> query(Map<String, dynamic> params) async {
    return list();
  }

  @override
  Future<int> update(T model) async {
    var db = await dbProvider.database;
    return db.update(tableName, adapter.toMap(model),
      where: '$idField = ?', whereArgs: [model.id]);
  }

  @override
  Future<int> create(T model) async {
    var db = await dbProvider.database;
    return db.insert(tableName, adapter.toMap(model));
  }
  
  @override
  Future<int> upsert(T model) {
    if (model.id == null) {
      return create(model);
    }
    return update(model);
  }
}
