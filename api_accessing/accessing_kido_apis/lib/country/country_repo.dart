import 'dart:convert';

import 'package:http/http.dart' as http;

class KidoCountryRepo {
  Future kidoCountryApis() async {
    var token =
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzYjQwNzczOWQ2ZWZkNmYxOWNmMDcxNiIsIm5hbWUiOiJzeXN0ZW0gYWRtaW4iLCJlbWFpbCI6InN5c2FkbWluQHN5c3RlbS5jb20iLCJpYXQiOjE2Nzk1NTUzMTcsImV4cCI6MTY4NzMzMTMxN30.xlmKsJlW04AGxwKhZNjVr_M8357M-NbaDr2WYsEhId4';

    try {
      var response = await http.get(
          Uri.parse('http://45.79.123.102:49005/api/country/all'),
          headers: {'Authorization': token});
      if (response.statusCode == 200) {
        
        return json.decode(response.body);
      } else {
        print('Error = ${response.statusCode}');
      }
    } catch (e) {
      print('Error = ${e.toString()}');
    }
  }
}
