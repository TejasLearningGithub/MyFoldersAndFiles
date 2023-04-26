import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:kido_drop_down_apis/bookmark/book_mark_modal.dart';

class BookMarkRepo {
  BookMarkModal bookMarkModal = BookMarkModal();

  Future toggle() async {
    try {
      var token =
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzYjQwNzczOWQ2ZWZkNmYxOWNmMDcxNiIsIm5hbWUiOiJzeXN0ZW0gYWRtaW4iLCJlbWFpbCI6InN5c2FkbWluQHN5c3RlbS5jb20iLCJpYXQiOjE2NzkwNDQ0NzQsImV4cCI6MTY4NjgyMDQ3NH0.IQBBZ6LftcJ2Xa-0_L6JkWTZ1Tj2f8w9GHONf545-w0';
      var headers = {
        // 'Content-Type': 'application/json',
        'Authorization': token,
      };

      var response = await http.post(
        Uri.parse('http://45.79.123.102:49005/api/bookmark/switch'),
        body: {
          "id": "643e4efcc10c3eefd761a0dc",
          "type": "followups",
        },
        headers: headers,
      );

      if (response.statusCode == 200) {
         bookMarkModal = bookMarkFromJson(response.body);
        log('Response Success');
        log(response.body);
        return bookMarkModal;
      }
    } catch (e) {
      log('error in toggle = ${e.toString()}');
    }
  }
}
