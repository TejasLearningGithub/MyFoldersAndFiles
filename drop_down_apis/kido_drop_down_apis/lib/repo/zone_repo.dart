import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class ZoneRepo {
  var token =
      'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzYjQwNzczOWQ2ZWZkNmYxOWNmMDcxNiIsIm5hbWUiOiJzeXN0ZW0gYWRtaW4iLCJlbWFpbCI6InN5c2FkbWluQHN5c3RlbS5jb20iLCJpYXQiOjE2Nzk0NzAzMTYsImV4cCI6MTY4NzI0NjMxNn0.joRJj__9oGdbGVC5UEhNKOyS5h60nYSb6bpVwIFAIuw';

  Future getZone({required String countryId}) async {
    try {
      var headers = {
        //'Content-Type': 'application/json',
        'Authorization': token,
      };
      var response = await http.post(
        Uri.parse(
          'http://45.79.123.102:49005/api/zone/getzonebycountry',
        ),
        body: {
          "country_id": countryId,
        },
        headers: headers,
      );
      if (response.statusCode == 200) {
        log('Success Response');
        return json.decode(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
