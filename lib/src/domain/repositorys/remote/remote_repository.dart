import 'dart:developer';

import 'package:monumentuz/library.dart';
import 'package:monumentuz/src/core/apis.dart';
import 'package:monumentuz/src/domain/models/remote_models.dart/all_monument_list_main_model.dart';
import 'package:monumentuz/src/domain/models/remote_models.dart/filter_data_model.dart';
import 'package:monumentuz/src/domain/models/remote_models.dart/search_main_model.dart';

class UserRepositoryImpl extends UserRepository{
  final Network network;

  UserRepositoryImpl({required this.network});

  //~ All manunents
  @override
  Future<AllManumentMainDataList?> getAllManuments()async {
    String? response = await network.methodGet(api: Apis.allDataList,);
    log("All Manuments::: $response :::");
    if(response != null){
    Map json = jsonDecode(response) as Map;
    log("Json::: $json :::");
    final item = AllManumentMainDataList.fromMap(json as Map<String,Object?>);
    log("Item::: ${item.success} :::");
    return item;
    }else{
      return null;
    }
  }

  @override
  Future<AllManumentMainDataList?> getOneManuments(int id) async{
    String? response = await network.methodGet(api: Apis.allDataList,id: id);
    log("All Manuments::: $response :::");
    if(response != null){
      Map json = jsonDecode(response) as Map;
      log("Json::: $json :::");
      final item = AllManumentMainDataList.fromMap(json as Map<String,Object?>);
      log("Item::: ${item.success} :::");
      return item;
    }else{
      return null;
    }
  }

  @override
  Future<SearchMainModel?> searchMonument(String title) async{
    String? response = await network.methodSearch(api: Apis.search, query: {
      "page":"0",
      "size":"10",
      "search":title
    },);
    log("All Manuments::: $response :::");
    if(response != null){
      Map json = jsonDecode(response) as Map;
      log("Json::: $json :::");
      final item = SearchMainModel.fromMap(json as Map<String,Object?>);
      log("Item::: ${item.success} :::");
      return item;
    }else{
      return null;
    }
  }

  @override
  Future<MainFilterModel?> filterMonument()async {
    String? response = await network.methodGet(api: Apis.allDataList,);
    log("All Manuments::: $response :::");
    if(response != null){
      Map json = jsonDecode(response) as Map;
      log("Json::: $json :::");
      final item = MainFilterModel.fromMap(json as Map<String,Object?>);
      log("Item::: ${item.success} :::");
      return item;
    }else{
      return null;
    }
  }

  @override
  Future<AllManumentMainDataList?> betweenManument(String yearOne, String yearTwo) async{
    String? response = await network.methodSearch(api: Apis.between, query: {
      "years": "${yearOne}-01-01",
      "year2":"${yearTwo}-01-01"
    },);
    log("All Manuments::: $response :::");
    if(response != null){
      Map json = jsonDecode(response) as Map;
      log("Json::: $json :::");
      final item = AllManumentMainDataList.fromMap(json as Map<String,Object?>);
      log("Item::: ${item.success} :::");
      return item;
    }else{
      return null;
    }
  }

  


}
