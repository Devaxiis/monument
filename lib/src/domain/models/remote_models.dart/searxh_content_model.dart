// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:monumentuz/src/domain/models/remote_models.dart/search_attechment_model.dart';

class SearchContentModel {
   final int id;
   final String nameUz;
   final String nameEng;
   final String buildAt;
   final String lon;
   final String lat;
   final String descriptionUz;
   final String descriptionEng;
   final String monumentRegion;
   final List<SearchAttechmentModel> attachments;
  SearchContentModel({
    required this.id,
    required this.nameUz,
    required this.nameEng,
    required this.buildAt,
    required this.lon,
    required this.lat,
    required this.descriptionUz,
    required this.descriptionEng,
    required this.monumentRegion,
    required this.attachments,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nameUz': nameUz,
      'nameEng': nameEng,
      'buildAt': buildAt,
      'lon': lon,
      'lat': lat,
      'descriptionUz': descriptionUz,
      'descriptionEng': descriptionEng,
      'monumentRegion': monumentRegion,
      'attachments': attachments.map((x) => x.toMap()).toList(),
    };
  }

  factory SearchContentModel.fromMap(Map<String, dynamic> map) {
    return SearchContentModel(
      id: map['id'] as int,
      nameUz: map['nameUz'] as String,
      nameEng: map['nameEng'] as String,
      buildAt: map['buildAt'] as String,
      lon: map['lon'] as String,
      lat: map['lat'] as String,
      descriptionUz: map['descriptionUz'] as String,
      descriptionEng: map['descriptionEng'] as String,
      monumentRegion: map['monumentRegion'] as String,
      attachments: List<SearchAttechmentModel>.from((map['attachments'] as List).map<SearchAttechmentModel>((x) => SearchAttechmentModel.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchContentModel.fromJson(String source) => SearchContentModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
