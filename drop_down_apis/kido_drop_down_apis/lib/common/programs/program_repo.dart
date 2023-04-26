import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class ProgramRepo {
  String token =
      'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzYjQwNzczOWQ2ZWZkNmYxOWNmMDcxNiIsIm5hbWUiOiJzeXN0ZW0gYWRtaW4iLCJlbWFpbCI6InN5c2FkbWluQHN5c3RlbS5jb20iLCJpYXQiOjE2ODE5NzE0NTksImV4cCI6MTY4OTc0NzQ1OX0.bNrRbQA_Wo7lE_e5Ks8583vC_dCjSpyZ1-Zdk_bkWR8';

  Future getProgramsData() async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    try {
      var response = await http.get(
        Uri.parse('http://45.79.123.102:49005/api/program/all'),
        headers: headers,
      );
      if (response.statusCode == 200) {
        return json.decode(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
