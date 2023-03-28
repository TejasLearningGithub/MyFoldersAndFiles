import 'package:accessing_kido_apis/get_state_by_country_id/state_modal.dart';
import 'package:accessing_kido_apis/get_state_by_country_id/state_repo.dart';
import 'package:flutter/material.dart';

class StateProvider with ChangeNotifier {
  var repo = StateRepo();
  List<StateModal> stateList = [];

  Future getStateByCountryId() async {
    var response = await repo.getStateByCountryId();
    if (response['code'] == 200) {
      List<StateModal> myStateList = List<StateModal>.from(
        response["data"].map((e) => StateModal.fromJson(e)),
      );
      stateList = myStateList;
      notifyListeners();
      print('======');
      //print(await stateList);
    } else {
      print('Some Error Occured');
    }
  }
}
