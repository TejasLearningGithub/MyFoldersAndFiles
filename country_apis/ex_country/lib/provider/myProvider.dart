import 'dart:developer';

import 'package:ex_country/modal/country_modal.dart';
import 'package:ex_country/repository/repo.dart';
import 'package:flutter/material.dart';

class MyProvider with ChangeNotifier {
  List<StateModal> statesList = [];
  List<StateModal> get myList => statesList;
  var repo = Repository();
  Future getStatesProvider() async {
    try {
      var response = await repo.stateApi();

      // if (response['code'] == 200 || response['code'] == 201) {
      log('=====Success - 200 ok=====');
      List<StateModal> tempStateList = List<StateModal>.from(
        response["data"].map((e) => StateModal.fromJson(e)),
      );
      // notifyListeners();
      // } else {
      //   log('Some Error Occured');
      // }
      statesList = tempStateList;

      notifyListeners();
    } catch (e) {
      log('Error = ${e.toString()}');
    }
    return statesList;
  }
}
