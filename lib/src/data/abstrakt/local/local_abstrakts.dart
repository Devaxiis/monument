
import '../../../../library.dart';

abstract class LocalDataSource{
  Future<bool>store(StorageKey key,String data);
  String? read(StorageKey key);
  Future<bool>remove(StorageKey key);
}
