import 'dart:io';

import 'package:accessing_kido_apis/country/country_model.dart';
import 'package:accessing_kido_apis/country/country_repo.dart';

import 'package:flutter/material.dart';

class CountryProvider with ChangeNotifier {
  var repo = KidoCountryRepo();
  List<CountryModal> countryList = [];

  Future getCountries() async {
    try {
      var response = await repo.kidoCountryApis();

      if (response['code'] == 200) {
        // List<Country> myCountryList =
        //     List<Country>.from(response .map((e) => Country.fromJson(e)));
        List<CountryModal> myCountryList = List<CountryModal>.from(
          response['data'].map((e) => CountryModal.fromJson(e)),
        );

        countryList = myCountryList;
        notifyListeners();
      } else {
        print('Some Error Occured');
      }
    } on SocketException catch (e) {
      print(e.message.toString());
    } catch (e) {
      print(e.toString());
    }
  }
}
