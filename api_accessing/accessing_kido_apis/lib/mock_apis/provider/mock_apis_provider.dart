import 'package:accessing_kido_apis/mock_apis/model/person.dart';
import 'package:accessing_kido_apis/mock_apis/repo/mock_apis_repo.dart';
import 'package:flutter/material.dart';

class MockProvider with ChangeNotifier {
  var repo = MockRepository();
  Person? person;
  Person? personData;

  Person? get myPersonData => personData;
  List<Person> myList = [];
  List<Person> get myPersonLIst => myList;

  Future<List<Person>> getData() async {
    myList = await repo.getDataRepo();
    notifyListeners();
    return myList;
  }
}
