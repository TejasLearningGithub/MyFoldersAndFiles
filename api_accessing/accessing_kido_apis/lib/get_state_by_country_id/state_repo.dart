import 'dart:convert';

import 'package:accessing_kido_apis/get_state_by_country_id/state_modal.dart';
import 'package:http/http.dart' as http;

class StateRepo {
  Future getStateByCountryId() async {
    List<StateModal> state = [];
    StateModal? myState;

    try {
      var token =
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzYjQwNzczOWQ2ZWZkNmYxOWNmMDcxNiIsIm5hbWUiOiJzeXN0ZW0gYWRtaW4iLCJlbWFpbCI6InN5c2FkbWluQHN5c3RlbS5jb20iLCJpYXQiOjE2Nzk0NzAzMTYsImV4cCI6MTY4NzI0NjMxNn0.joRJj__9oGdbGVC5UEhNKOyS5h60nYSb6bpVwIFAIuw';
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': token,
      };
      final String url =
          "http://45.79.123.102:49005/api/state/getstatebycountry";
      final Map<String, dynamic> body = {"country_id": 103};

      http.Request request = http.Request('GET', Uri.parse(url));
      request.headers.addAll(headers);
      request.body = jsonEncode(body);

      // http.StreamedResponse response = await request.send();

      // if (response.statusCode == 200) {
      //   // handle successful response
      //   http.StreamedResponse streamResponse = await request.send();

      // http.Response response = await http.Response.fromStream(streamResponse);
      //   String responseBody = await response.stream.bytesToString();

      //   // print(responseBody);

      //   print(response.body);
      //   //======================================
      //    //       Iterable it = jsonDecode(response.body);
      //    //country  = it.map((e) => Country.fromJson(e)).toList();

      //   print('It Works!!!');
      // } else {
      //   // handle error response
      //   print("Error: ${response.statusCode}");
      // }
      // return country;
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // handle successful response
        String responseBody = await response.stream.bytesToString();
        print(response.statusCode);
        print(responseBody);
        return json.decode(responseBody);
      } else {
        // handle error response
        print("Error: ${response.statusCode}");
      }
    } catch (e) {
      print('Catch Error = ${e.toString()}');
    }
  }
}
