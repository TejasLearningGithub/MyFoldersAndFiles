import 'dart:convert';

MyPetsModal petsModalFromJson(String str) =>
    MyPetsModal.fromJson(json.decode(str));

String petsToJson(MyPetsModal data) => jsonEncode(data.toJson());

class MyPetsModal {
  List<Data>? data;

  MyPetsModal({this.data});

  MyPetsModal.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? userName;
  String? petName;
  String? petImage;
  bool? isFriendly;

  Data({this.id, this.userName, this.petName, this.petImage, this.isFriendly});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    petName = json['petName'];
    petImage = json['petImage'];
    isFriendly = json['isFriendly'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['petName'] = this.petName;
    data['petImage'] = this.petImage;
    data['isFriendly'] = this.isFriendly;
    return data;
  }
}
