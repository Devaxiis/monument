// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'dart:convert';

import 'package:monumentuz/src/domain/models/remote_models.dart/all_monument_list_attechment_model.dart';



class AllManumentDataDataList {
     int id;
     String nameUz;
     String nameEng;
     String buildAt;
     String lon;
     String lat;
     String descriptionUz;
     String descriptionEng;
     String monumentRegion;
     List<AllManumentAttechmentDataList> attachments;

  AllManumentDataDataList({
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

  factory AllManumentDataDataList.fromMap(Map<String, Object?> map) {
    return AllManumentDataDataList(
      id: map['id'] as int,
      nameUz: map['nameUz'] as String,
      nameEng: map['nameEng'] as String,
      buildAt: map['buildAt'] as String,
      lon: map['lon'] as String,
      lat: map['lat'] as String,
      descriptionUz: map['descriptionUz'] as String,
      descriptionEng: map['descriptionEng'] as String,
      monumentRegion: map['monumentRegion'] as String,
      attachments: List<AllManumentAttechmentDataList>.from((map['attachments'] as List<Object?>).map<AllManumentAttechmentDataList>((x) => AllManumentAttechmentDataList.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory AllManumentDataDataList.fromJson(String source) => AllManumentDataDataList.fromMap(json.decode(source) as Map<String, dynamic>);
}
