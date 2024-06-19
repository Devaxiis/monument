import 'dart:convert';
import 'dart:developer';
import 'package:monumentuz/src/core/apis.dart';
import 'package:monumentuz/src/data/abstrakt/remote/remote_abstrakts.dart';
import 'package:http/http.dart' as http;



class GetNetwork implements Network{

  //Backenddan berilgan malumotlarni ochirish uchun method
  @override
  Future<String?> methodDelete({required String api}) async{
      Uri url = Uri.https(Apis.baseUrl,api);
    try {
    
      final response = await http.delete(url);
      if(response.statusCode >= 200 || response.statusCode <= 201){
      return response.body;
      }else{
        return null;
      }
    } catch (e) {
      throw Exception("Method Delete ERROR:===> $e <===");
    }
  }

  //Backenddan kerakli malumotni olib kelish uchun method
  @override
  Future<String?> methodGet({required String api,int? id})async {
      Uri url = Uri.https(Apis.baseUrl,"$api${id ?? ""}",);
   try {
      final response = await http.get(url);
      if(response.statusCode >= 200 && response.statusCode <= 299){
          return utf8.decoder.convert(response.bodyBytes);
      }else{
        return null;
      }
    } catch (e) {
      throw Exception("Method Get ERROR:===> $e <===");
    }
  }

  //Backendga kerakli malumotni kiritish uchun kerak.
  @override
  Future<String?> methodPost({required String api, required String data,}) async{
      Uri url = Uri.https(Apis.baseUrl,api,);
    try {
      final response = await http.post(url,encoding: Encoding.getByName("UTF-8"));
      log(response.body);
      log("${response.statusCode}");
      if(response.statusCode >= 200 && response.statusCode <= 299){
        return response.body;
      }else{
        return null;
      }
    } catch (e) {
      throw Exception("Method Post ERROR:===> $e <===");
    }
    }

  @override
  Future<String?> methodSearch({required String api, required Map<String, dynamic> query})async {
    log("${Apis.baseUrl}$api$query");
    Uri url = Uri.https(Apis.baseUrl,api,query);
    log("Url=== $url");
    try {
      final response = await http.get(url);
      log("-------------");
      log(response.body);
      log("-------------");
      if(response.statusCode >= 200 && response.statusCode <= 299){
        return utf8.decoder.convert(response.bodyBytes);
      }else{
        return null;
      }
    } catch (e) {
      throw Exception("Method Get ERROR:===> $e <===");
    }
  }

}

