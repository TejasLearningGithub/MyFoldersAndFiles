import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kido_drop_down_apis/model/country_model.dart';
import 'package:kido_drop_down_apis/repo/country_repo.dart';

class CountryProvider with ChangeNotifier {
  var repo = CountryRepo();
  List<CountryModel> countryList = [];
  Future getCountriesData() async {
    var response = await repo.getCountryData();

    if (response['code'] == 200) {
      log('Success Response');
      List<CountryModel> myCountryList = List<CountryModel>.from(
        response['data'].map(
          (e) => CountryModel.fromJson(e),
        ),
      );
      countryList = myCountryList;
      notifyListeners();
    }
  }
}
