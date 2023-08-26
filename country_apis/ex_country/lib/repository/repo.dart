import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class Repository {
  //var repo = Repository();
  var url = 'https://countriesnow.space/api/v0.1/countries/states';
  var country = 'India';

  Future<http.Response> getRequest() async {
    var body = {'country': country};
    var headers = {
      'Content-Type': 'application/json',
    };

    var request = http.Request('GET', Uri.parse(url));
    request.body = jsonEncode(body);
    request.headers.addAll(headers);
    http.StreamedResponse streamResponse = await request.send();
    http.Response response = await http.Response.fromStream(streamResponse);

    return response;
  }

  Future stateApi() async {
    var response = await getRequest();
    if (response.statusCode == 200) {
      log(response.body, name: 'response countryApi');
      log('SUCCESS - REPO - 200 OK');
      return json.decode(response.body);
    } else {
      log(response.body, name: 'error countryApi');
      return json.decode(response.body);
    }
  }
}
