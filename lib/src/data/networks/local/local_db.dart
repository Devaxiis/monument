import 'package:monumentuz/src/data/abstrakt/local/local_abstrakts.dart';
import 'package:monumentuz/src/domain/repositorys/local/local_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LocalDataSourceImpl implements LocalDataSource{
  final SharedPreferences db;

  const LocalDataSourceImpl({required this.db});

  static Future<SharedPreferences> get init async{
    return SharedPreferences.getInstance();
  }

  @override
  String? read(StorageKey key) {
    return db.getString(key.name);
  }

  @override
  Future<bool> remove(StorageKey key) async {
    return db.remove(key.name);
  }

  @override
  Future<bool> store(StorageKey key, String data)async {
    return db.setString(key.name, data);
  }

}

