import 'dart:developer';

import 'package:fantasy_cult/app/models/user_profile_model.dart';
import 'package:fantasy_cult/app/repository/profile_repo.dart';

//import 'package:fantasy_cult/app/utils/my_sharepreferences.dart';
import 'package:flutter/foundation.dart';

class ProfileProvider extends ChangeNotifier {
  final repo = ProfileRepo();

  ProfileModel fantasyUser = ProfileModel();

  // Future<ProfileModel> getData() async {
  //   String? accessToken =
  //       await MySharedPreferences.instance.getStringValue("access_token");
  //   fantasyUser = (await repo.getData(token: 'Bearer $accessToken'));
  //   notifyListeners();
  //   return fantasyUser;
  // }

  Future profileDetails() async {
    try {
      // String? token =
      //     await MySharedPreferences.instance.getStringValue("access_token");
      final response = await repo.getProileDetails();
      log(response.toString(), name: 'response profileDetails');
      if (response['status_code'] == 200 || response['status_code'] == 201) {
        fantasyUser = ProfileModel.fromJson(response['data']);
        notifyListeners();
        return fantasyUser;
        //log(response.toString(), name: 'Success Response 200 ok');

        //notifyListeners();
      }
    } catch (e) {
      log(e.toString(), name: 'error profileDetails');
    }
  }
}
