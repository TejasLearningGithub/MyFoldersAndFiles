import 'dart:developer';

import 'package:example_first/modal/posts_model.dart';
import 'package:example_first/repo/posts_repo.dart';
import 'package:flutter/material.dart';

class PostsProvider with ChangeNotifier {
  var repo = PostsRepo();
  List<PostsModal> tempPostList = [];
  List<PostsModal> myList = [];
   Future getData() async {
    try {
    tempPostList =  await repo.getData();
      // tempPostList = List<PostsModal>.from(
      //   res["data"].map((e) => PostsModal.fromJson(e)),
      // );
      myList = myList + tempPostList;
      notifyListeners();
    } catch (e) {
      log('Error = ${e.toString()}');
    }
  }
}
