import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

final a ={
  {
          "id": 0,
          "name": "string",
          "contentType": "string",
          "contentURL": "string",
          "size": 0
        }
};

class AllManumentAttechmentDataList {
    int id;
    String name;
    String contentType;
    String contentURL;
    int size;
  AllManumentAttechmentDataList({
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

  factory AllManumentAttechmentDataList.fromMap(Map<String, dynamic> map) {
    return AllManumentAttechmentDataList(
      id: map['id'] as int,
      name: map['name'] as String,
      contentType: map['contentType'] as String,
      contentURL: map['contentURL'] as String,
      size: map['size'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory AllManumentAttechmentDataList.fromJson(String source) => AllManumentAttechmentDataList.fromMap(json.decode(source) as Map<String, dynamic>);
}
