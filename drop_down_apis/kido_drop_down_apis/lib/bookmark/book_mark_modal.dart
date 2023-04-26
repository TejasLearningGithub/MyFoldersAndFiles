import 'dart:convert';

BookMarkModal bookMarkFromJson(String str) =>  BookMarkModal.fromJson(json.decode(str));

String bookMarkToJson(BookMarkModal data) => json.encode(data.toJson());




class BookMarkModal {
  String? message;
  List<String>? data;
  int? code;
  bool? success;

  BookMarkModal({this.message, this.data, this.code, this.success});

  BookMarkModal.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    // if (json['data'] != null) {
    //   data = <String>[];
    //   json['data'].forEach((v) {
    //     data!.add(String.fromJson(v));
    //   });
    // }
    code = json['code'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    // if (this.data != null) {
    //   data['data'] = this.data!.map((v) => v.toJson()).toList();
    // }
    data['code'] = code;
    data['success'] = success;
    return data;
  }
}
