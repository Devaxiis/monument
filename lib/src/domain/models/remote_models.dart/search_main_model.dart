
import 'dart:convert';
import 'package:monumentuz/src/domain/models/remote_models.dart/search_data_get_model.dart';

class SearchMainModel {
final bool success;
final SearchDataModel data;
  SearchMainModel({
    required this.success,
    required this.data,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'success': success,
      'data': data.toMap(),
    };
  }

  factory SearchMainModel.fromMap(Map<String, dynamic> map) {
    return SearchMainModel(
      success: map['success'] as bool,
      data: SearchDataModel.fromMap(map['data'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchMainModel.fromJson(String source) => SearchMainModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
