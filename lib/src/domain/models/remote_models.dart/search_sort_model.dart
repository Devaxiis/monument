import 'dart:convert';


class SortModel {
   final bool empty;
   final bool sorted;
   final bool unsorted;
  SortModel({
    required this.empty,
    required this.sorted,
    required this.unsorted,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'empty': empty,
      'sorted': sorted,
      'unsorted': unsorted,
    };
  }

  factory SortModel.fromMap(Map<String, dynamic> map) {
    return SortModel(
      empty: map['empty'] as bool,
      sorted: map['sorted'] as bool,
      unsorted: map['unsorted'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory SortModel.fromJson(String source) => SortModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
