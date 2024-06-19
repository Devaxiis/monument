// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:monumentuz/src/domain/models/remote_models.dart/all_monument_list_data_model.dart';
import 'package:monumentuz/src/domain/models/remote_models.dart/search_pageable_model.dart';
import 'package:monumentuz/src/domain/models/remote_models.dart/search_sort_model.dart';
import 'package:monumentuz/src/domain/models/remote_models.dart/searxh_content_model.dart';

class SearchDataModel {
 final List<AllManumentDataDataList> content;
 final PageableModel pageable;
 final int totalPages;
 final int totalElements;
 final bool last;
 final int size;
 final int number;
 final SortModel sort;
 final int numberOfElements;
 final bool first;
 final bool empty;
  SearchDataModel({
    required this.content,
    required this.pageable,
    required this.totalPages,
    required this.totalElements,
    required this.last,
    required this.size,
    required this.number,
    required this.sort,
    required this.numberOfElements,
    required this.first,
    required this.empty,
  });



  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'content': content.map((x) => x.toMap()).toList(),
      'pageable': pageable.toMap(),
      'totalPages': totalPages,
      'totalElements': totalElements,
      'last': last,
      'size': size,
      'number': number,
      'sort': sort.toMap(),
      'numberOfElements': numberOfElements,
      'first': first,
      'empty': empty,
    };
  }

  factory SearchDataModel.fromMap(Map<String, dynamic> map) {
    return SearchDataModel(
      content: List<AllManumentDataDataList>.from((map['content'] as List).map<AllManumentDataDataList>((x) => AllManumentDataDataList.fromMap(x as Map<String,dynamic>),),),
      pageable: PageableModel.fromMap(map['pageable'] as Map<String,dynamic>),
      totalPages: map['totalPages'] as int,
      totalElements: map['totalElements'] as int,
      last: map['last'] as bool,
      size: map['size'] as int,
      number: map['number'] as int,
      sort: SortModel.fromMap(map['sort'] as Map<String,dynamic>),
      numberOfElements: map['numberOfElements'] as int,
      first: map['first'] as bool,
      empty: map['empty'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchDataModel.fromJson(String source) => SearchDataModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
