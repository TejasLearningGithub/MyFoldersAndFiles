import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kido_drop_down_apis/filter_functionality/mock_apis/model/person.dart';
import 'package:kido_drop_down_apis/filter_functionality/mock_apis/repository/person_repo.dart';

class PersonProvider with ChangeNotifier {
  var repo = PersonRepo();
  List<Person> myPersonList = [];
  List<Person> get exPersonList => myPersonList;
  List<Person> filteredList = [];

  Future getPersonData() async {
    myPersonList = (await repo.getData())!;
    notifyListeners();
    return myPersonList;
  }

  void filterCountries(value) {
    filteredList = myPersonList
        .where(
          (element) => element.firstName!.toLowerCase().contains(
                value.toLowerCase(),
              ),
        )
        .toList();
    log('you have entered = $value');
    notifyListeners();
  }
}
