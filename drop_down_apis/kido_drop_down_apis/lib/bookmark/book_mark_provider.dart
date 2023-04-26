import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kido_drop_down_apis/bookmark/book_mark_modal.dart';
import 'package:kido_drop_down_apis/bookmark/book_mark_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookMarkProvider with ChangeNotifier {
  BookMarkModal bookMarkModal = BookMarkModal();
  BookMarkRepo repo = BookMarkRepo();
  //List<BookMarkModal> myList = [];
  BookMarkModal get myBookMarkModal => bookMarkModal;
  Future doToggle() async {
    var response = await repo.toggle();
    // List<BookMarkModal> tempBookmarkList = List<BookMarkModal>.from(
    //   response["data"].map((e) => BookMarkModal.fromJson(e)),
    // );
    //var myResponse = await repo.toggle();
    bookMarkModal = response;
    notifyListeners();
    //}
  }
}
