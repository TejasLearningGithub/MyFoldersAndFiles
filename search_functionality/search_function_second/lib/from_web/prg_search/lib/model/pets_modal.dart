import 'dart:convert';

PetsModal petsFromJson(String str) => PetsModal.fromJson(json.decode(str));

String petsToJson(PetsModal data) => json.encode(data.toJson());

class PetsModal {
  List<Data>? data;

  PetsModal({this.data});

  PetsModal.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userName'] = userName;
    data['petName'] = petName;
    data['petImage'] = petImage;
    data['isFriendly'] = isFriendly;
    return data;
  }
}
