// To parse this JSON data, do
//
//     final postsModal = postsModalFromJson(jsonString);

// import 'dart:convert';

// PostsModal postsModalFromJson(String str) => PostsModal.fromJson(json.decode(str));

// String postsModalToJson(PostsModal data) => json.encode(data.toJson());

class PostsModal {
  int userId;
  int id;
  String title;
  String body;

  PostsModal({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostsModal.fromJson(Map<String, dynamic> json) => PostsModal(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
