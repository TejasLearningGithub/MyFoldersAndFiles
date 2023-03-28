import 'dart:convert';

import 'package:follow_up_kido/api_accessing/model/follow_up_modal.dart';
import 'package:http/http.dart' as http;

class FollowUpRepository {
  var url = 'http://45.79.123.102:49005/api/followups/all/today/1';

  Future getFollowUpsData() async {
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List<String> list1 = [];
        List<String> list2 = [];
        // Iterable it = jsonDecode(response.body);
        // List<MyFollowUpModel> myFollowUpList =
        //     it.map((e) => MyFollowUpModel.fromJson(e)).toList();
        // print(response.body);
        // print('It Works');
        //return jsonDecode(response.body);
        //List myList = jsonDecode(response.body);
        //return myList.map((e) => MyFollowUpModel.fromJson(e)).toList();
        //=========================================
        final jsonData = json.decode(response.body);
        jsonData['data'].forEach((item) => {list1.add(item['followups'])});
      }
    } catch (e) {
      print(e.toString());
    }
    throw Exception('unexpected error occured');
  }
}
