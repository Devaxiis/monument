abstract class Network{
  Future<String?> methodGet({required String api,int id});
  Future<String?> methodPost({required String api, required String data});
  Future<String?> methodDelete({required String api});
  Future<String?> methodSearch({required String api,required Map<String,dynamic> query});
}