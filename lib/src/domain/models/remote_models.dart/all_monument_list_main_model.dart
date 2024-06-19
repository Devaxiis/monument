// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:monumentuz/src/domain/models/remote_models.dart/all_monument_list_data_model.dart';
import 'package:monumentuz/src/domain/models/remote_models.dart/all_monument_list_error_model.dart';

class AllManumentMainDataList {
   bool success;
  //  String? message;
   List<AllManumentDataDataList?> data;
  //  List<AllManumentErrorDataList?> errors;
   
  AllManumentMainDataList({
    required this.success,
    // required this.message,
    required this.data,
    // required this.errors,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'success': success,
      'data': data.map((x) => x?.toMap()).toList(),
    };
  }

  factory AllManumentMainDataList.fromMap(Map<String, dynamic> map) {
    return AllManumentMainDataList(
      success: map['success'] as bool,
      data: List<AllManumentDataDataList?>.from((map['data'] as List<Object?>).map<AllManumentDataDataList?>((x) => AllManumentDataDataList.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory AllManumentMainDataList.fromJson(String source) => AllManumentMainDataList.fromMap(json.decode(source) as Map<String, dynamic>);
}


