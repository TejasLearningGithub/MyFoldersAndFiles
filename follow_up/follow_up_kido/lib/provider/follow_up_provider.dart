import 'package:flutter/material.dart';
import 'package:follow_up_kido/api_accessing/model/follow_up_modal.dart';
import 'package:follow_up_kido/api_accessing/repo/follow_up_repo.dart';

class FollowUpProvider with ChangeNotifier {
  var repo = FollowUpRepository();
  //List<MyFollowUpModel> myFollowUpModal = [];
  //List<MyFollowUpModel> get myFollUp => myFollowUpModal;
  List<MyFollowUpModel> myList = [];
  List<MyFollowUpModel> get myFlist => myList;
  MyFollowUpModel m = MyFollowUpModel();

  Future<List<MyFollowUpModel>> getData() async {
   var myFollowUpModal = await repo.getFollowUpsData();
    notifyListeners();
    List<MyFollowUpModel> followUpList = List<MyFollowUpModel>.from(
            myFollowUpModal['data']['followups']
                .map((e) => MyFollowUpModel.fromJson(e)));
    notifyListeners();
    return followUpList;
  }
}
