import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class SearchAttechmentModel {
   
  final int id;
  final String name;
  final String contentType;
  final String contentURL;
  final int size;
  SearchAttechmentModel({
    required this.id,
    required this.name,
    required this.contentType,
    required this.contentURL,
    required this.size,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'contentType': contentType,
      'contentURL': contentURL,
      'size': size,
    };
  }

  factory SearchAttechmentModel.fromMap(Map<String, dynamic> map) {
    return SearchAttechmentModel(
      id: map['id'] as int,
      name: map['name'] as String,
      contentType: map['contentType'] as String,
      contentURL: map['contentURL'] as String,
      size: map['size'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchAttechmentModel.fromJson(String source) => SearchAttechmentModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
