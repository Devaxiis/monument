
import '../../../../library.dart';

abstract class OrderRepository{
  Future<bool> setUser(String data);
  String readUser();
  Future<bool> deleteUser();
  Future<bool> setUserImg(String data);
  String readUserImg();
  Future<bool> deleteUserImg();
  Future<bool> setUserBookmark(AllManumentDataDataList data);
  List<AllManumentDataDataList> readUserBookmark();
  Future<bool> deleteUserBookmark(AllManumentDataDataList data);

}