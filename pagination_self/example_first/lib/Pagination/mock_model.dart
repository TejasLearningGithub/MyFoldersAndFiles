// To parse this JSON data, do
//
//     final mockModel = mockModelFromJson(jsonString);

import 'dart:convert';

MockModel mockModelFromJson(String str) => MockModel.fromJson(json.decode(str));

String mockModelToJson(MockModel data) => json.encode(data.toJson());

class MockModel {
    String id;
    DateTime createdAt;
    String name;
    String avatar;

    MockModel({
        required this.id,
        required this.createdAt,
        required this.name,
        required this.avatar,
    });

    factory MockModel.fromJson(Map<String, dynamic> json) => MockModel(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        name: json["name"],
        avatar: json["avatar"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt.toIso8601String(),
        "name": name,
        "avatar": avatar,
    };
}
