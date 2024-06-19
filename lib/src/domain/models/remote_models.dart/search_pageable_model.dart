

import 'dart:convert';
import 'package:monumentuz/src/domain/models/remote_models.dart/search_sort_model.dart';

class PageableModel {
final int pageNumber;
final int pageSize;
final SortModel sort;
final int offset;
final bool paged;
final bool unpaged;
  PageableModel({
    required this.pageNumber,
    required this.pageSize,
    required this.sort,
    required this.offset,
    required this.paged,
    required this.unpaged,
  });
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pageNumber': pageNumber,
      'pageSize': pageSize,
      'sort': sort.toMap(),
      'offset': offset,
      'paged': paged,
      'unpaged': unpaged,
    };
  }

  factory PageableModel.fromMap(Map<String, dynamic> map) {
    return PageableModel(
      pageNumber: map['pageNumber'] as int,
      pageSize: map['pageSize'] as int,
      sort: SortModel.fromMap(map['sort'] as Map<String,dynamic>),
      offset: map['offset'] as int,
      paged: map['paged'] as bool,
      unpaged: map['unpaged'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory PageableModel.fromJson(String source) => PageableModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
