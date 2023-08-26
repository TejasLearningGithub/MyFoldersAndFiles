import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class CountryRepo {
  var url = 'https://countriesnow.space/api/v0.1/countries/states';

  Future<http.Response> postMethod({required Map<String, dynamic> data}) async {
    var headers = {
      'Content-Type': 'application/json',
    };
    var response = await http.post(Uri.parse(url),
        headers: headers, body: json.encode(data));
    return response;
  }

  Future sendData() async {
    var data = {"country": "Nigeria"};
    var res = await postMethod(data: data);

    if (res.statusCode == 200) {
      log('Response - Success');
      return json.decode(res.body);
    } else {
      log('Response - Error');
    }
  }

  Future<http.Response> getHttp({
    required String api,
    String? token,
  }) async {
    log(api, name: 'getHttp');

    return http
        .get(Uri.parse(url), headers: {'Content-Type': 'application/json'});
  }
}
