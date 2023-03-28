import 'package:accessing_kido_apis/mock_api_self/repo/mock_repo.dart';
import 'package:accessing_kido_apis/mock_apis/model/person.dart';
import 'package:flutter/material.dart';

class MockApiProvider with ChangeNotifier{
  var myMockRepo = MyMockRepo();

  List<Person> myPersonList = [];
  List<Person> get myPerson => myPersonList;  
  
  Future<List<Person>> fetchData() async{
    myPersonList = await myMockRepo.getPersonData();
    notifyListeners();
    return myPersonList;
  }
}