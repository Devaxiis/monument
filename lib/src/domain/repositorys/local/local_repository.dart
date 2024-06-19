import 'dart:developer';

import 'package:monumentuz/library.dart';
import 'package:monumentuz/src/domain/models/remote_models.dart/all_monument_list_data_model.dart';

class OrderRepositoryImpl implements OrderRepository {
  final LocalDataSource dataSource;

  const OrderRepositoryImpl({required this.dataSource});

  @override
  Future<bool> deleteUser() async {
    return dataSource.remove(StorageKey.isHaveUser);
  }

  @override
  String readUser() {
    String data = dataSource.read(StorageKey.isHaveUser) ?? "";
    return data;
  }

  @override
  Future<bool> setUser(String value) async {
    String list = readUser();
    list = value;
    return await dataSource.store(StorageKey.isHaveUser, list);
  }

  // Image
  @override
  Future<bool> deleteUserImg() {
    return dataSource.remove(StorageKey.image);
  }

  @override
  String readUserImg() {
    final data = dataSource.read(StorageKey.image) ?? "";
    return data;
  }

  @override
  Future<bool> setUserImg(String value) async {
    String img = readUserImg();
    img = value;
    return await dataSource.store(StorageKey.image, img);
  }

  @override
  Future<bool> deleteUserBookmark(AllManumentDataDataList data) async{
    List<AllManumentDataDataList> item = readUserBookmark();
    log("W5");
    item.removeLast();
    List value = item.map((e) => e.toJson()).toList();
    final json = jsonEncode(value);
    return await dataSource.store(StorageKey.bookmark, json);
  }

  @override
  List<AllManumentDataDataList> readUserBookmark(){
   String? list  = dataSource.read(StorageKey.bookmark)??"[]";
   List data = jsonDecode(list) as List;
   List<AllManumentDataDataList> json = data.map((e) => AllManumentDataDataList.fromJson(e)).toList();
   return json;
  }

  @override
  Future<bool> setUserBookmark(AllManumentDataDataList data) async {
    final item = readUserBookmark();
    item.add(data);
    List value = item.map((e) => e.toJson()).toList();
    final json = jsonEncode(value);
    return await dataSource.store(StorageKey.bookmark, json);
  }


}

enum StorageKey { isHaveUser, image, bookmark }
