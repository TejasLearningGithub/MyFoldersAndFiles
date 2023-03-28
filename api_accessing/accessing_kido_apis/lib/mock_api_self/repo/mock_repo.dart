import 'dart:convert';

import 'package:accessing_kido_apis/mock_apis/model/person.dart';
import 'package:http/http.dart' as http;

class MyMockRepo {
  Future<List<Person>> getPersonData() async {
    try {
      var response = await http.get(
        Uri.parse('http://6308255046372013f576f9b5.mockapi.io/person'),
      );
      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body);
        List<Person> person = it.map((e) => Person.fromJson(e)).toList();

        return person;
      }
    } catch (e) {
      print('Error is $e');
    }

    throw Exception('Unexpected Error Occured');
  }
}
