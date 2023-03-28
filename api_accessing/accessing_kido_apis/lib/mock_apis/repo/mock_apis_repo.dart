import 'dart:convert';

import 'package:accessing_kido_apis/mock_apis/model/person.dart';
import 'package:http/http.dart' as http;

class MockRepository {
  String baseUrl = 'http://6308255046372013f576f9b5.mockapi.io/person';
  var response;
  Future<List<Person>> getDataRepo() async {
    try {
      response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        print(response.body);
        // return jsonDecode(response.body);
        Iterable it = jsonDecode(response.body);
        List<Person> person = it.map((e) => Person.fromJson(e)).toList();
        print('It Works.....');
       return person;
      } else {
        print('Error = ${response.statusCode}');
      }
    } catch (e) {
      print('Error = ${e.toString()}');
    }
    throw Exception('Unexpected Error Occured ');
  }
}
