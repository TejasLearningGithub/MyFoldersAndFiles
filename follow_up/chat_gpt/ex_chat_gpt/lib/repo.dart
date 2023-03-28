import 'dart:convert';
import 'package:http/http.dart' as http;

class DataRepository {
  final String apiUrl =
      'http://45.79.123.102:49005/api/followups/all/yesterday/1';

  Future<List<Map<String, dynamic>>?> fetchData() async {
    var token =
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzYjQwNzczOWQ2ZWZkNmYxOWNmMDcxNiIsIm5hbWUiOiJzeXN0ZW0gYWRtaW4iLCJlbWFpbCI6InN5c2FkbWluQHN5c3RlbS5jb20iLCJpYXQiOjE2NzkwNDQ0NzQsImV4cCI6MTY4NjgyMDQ3NH0.IQBBZ6LftcJ2Xa-0_L6JkWTZ1Tj2f8w9GHONf545-w0';
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {'Authorization': token},
      );

      if (response.statusCode == 200 || response.statusCode == 400) {
        final jsonData = jsonDecode(response.body);
        final dataList = List<Map<String, dynamic>>.from(jsonData['data']);
        print(dataList);
        print('it works');
        return dataList;
      } else {
        print('Error = ${response.statusCode}');
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
