import 'dart:developer';
import 'dart:io';

import 'package:ex_country/Post_Method/modal/country.dart';
import 'package:ex_country/Post_Method/repository/country_repo.dart';
import 'package:flutter/material.dart';

class PostProvider with ChangeNotifier {
  var repo = CountryRepo();
  List<CountryModal> countryList = [];
  List<CountryModal> get myList => countryList;

  Future getCountryProvider() async {
    try {
      var response = await repo.sendData();
      List<CountryModal> tempCountryList = List<CountryModal>.from(
        response("data").map((e) => CountryModal.fromJson(e)),
      );
      countryList = tempCountryList;
      notifyListeners();
      return countryList;
    } catch (e) {
      log(e.toString());
    }
  }

  Future getDataSimple() async {
    try {
      var response = await getCountryProvider();
      if (response['code'] == 200) {
        List<CountryModal> tempStatusList = List<CountryModal>.from(
          response["data"].map((e) => CountryModal.fromJson(e)),
        );
        countryList = tempStatusList;
        log(response.toString(), name: 'response getStatus');
        notifyListeners();
      } else {
        log(response.toString(), name: 'error getStatus');
      }
    } on SocketException catch (e) {
      log(e.message.toString());
    } catch (e, s) {
      log(e.toString(), name: 'error catch getStatus', stackTrace: s);
    }
    return countryList;
  }
}
