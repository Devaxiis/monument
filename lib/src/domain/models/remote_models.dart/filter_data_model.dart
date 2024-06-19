// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'dart:convert';

import 'package:monumentuz/src/domain/models/remote_models.dart/all_monument_list_data_model.dart';

class MainFilterModel {
 bool success;
 List<AllManumentDataDataList> data;
  MainFilterModel({
    required this.success,
    required this.data,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'success': success,
      'data': data.map((x) => x.toMap()).toList(),
    };
  }

  factory MainFilterModel.fromMap(Map<String, dynamic> map) {
    return MainFilterModel(
      success: map['success'] as bool,
      data: List<AllManumentDataDataList>.from((map['data'] as List).map<AllManumentDataDataList>((x) => AllManumentDataDataList.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory MainFilterModel.fromJson(String source) => MainFilterModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
