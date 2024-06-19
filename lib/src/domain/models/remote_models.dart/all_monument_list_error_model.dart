import 'dart:convert';



class AllManumentErrorDataList {
  int status;
  String msg;
  String field;
  AllManumentErrorDataList({
    required this.status,
    required this.msg,
    required this.field,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'msg': msg,
      'field': field,
    };
  }

  factory AllManumentErrorDataList.fromMap(Map<String, dynamic> map) {
    return AllManumentErrorDataList(
      status: map['status'] as int,
      msg: map['msg'] as String,
      field: map['field'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AllManumentErrorDataList.fromJson(String source) => AllManumentErrorDataList.fromMap(json.decode(source) as Map<String, dynamic>);
}
