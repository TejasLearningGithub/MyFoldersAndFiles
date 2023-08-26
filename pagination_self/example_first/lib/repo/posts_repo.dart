import 'dart:convert';

import 'package:example_first/modal/posts_model.dart';
import 'package:http/http.dart' as http;

class PostsRepo {
  Future getData() async {
    var response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/',    ),  );
    if (response.statusCode == 200) {
      List postsList = json.decode(response.body);
      return postsList.map((e) => PostsModal.fromJson(e)).toList();
    }
  }
}
