import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:kido_drop_down_apis/filter_functionality/mock_apis/model/person.dart';

class PersonRepo{

  Future<List<Person>?> getData() async {
    try{
      var response = await http.get(Uri.parse('http://6308255046372013f576f9b5.mockapi.io/person'));
      if(response.statusCode == 200){
       // return json.decode(response.body);
       Iterable it = jsonDecode(response.body);
       List<Person> personList = it.map((e) => Person.fromJson(e)).toList();
       return personList;
      }
    }
    catch(e){
      log(e.toString());
    }
  }

}