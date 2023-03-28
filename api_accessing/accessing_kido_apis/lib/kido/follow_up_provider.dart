import 'dart:io';

import 'package:accessing_kido_apis/kido/follow_up_model.dart';
import 'package:accessing_kido_apis/kido/kido_repo.dart';
import 'package:flutter/material.dart';

class FollowUpProvider with ChangeNotifier {
  var repo = FollowupRepository();
  List<FollowUpModel> noFollowupsList = [];

  Future getFollowUp() async {
    try {
      var response = await repo.followUpApis();

      if (response['code'] == 200) {
        List<FollowUpModel> followUpList = List<FollowUpModel>.from(
            response["data"]['followups']
                .map((e) => FollowUpModel.fromJson(e)));

        noFollowupsList = followUpList;
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
