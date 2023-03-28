// import 'package:accessing_kido_apis/model/country_model.dart';
// import 'package:accessing_kido_apis/repository/country_repo.dart';
// import 'package:accessing_kido_apis/repository/country_repo_second.dart';
// import 'package:flutter/material.dart';

// class CountryProvider extends ChangeNotifier {
//   var repo = CountryRepo();
//   var myRepo = CountryRepoSecond();
//   List<Country> myList = [];

//   List<Country> get myData => myList;

//   Map<String, dynamic> myCountryId = {'country_id': 103};
//   Future<List<Country>> getCountryData() async {
//     myList = (await myRepo.getCountries())!;
//     notifyListeners();
//     return myList;
//   }
// }
