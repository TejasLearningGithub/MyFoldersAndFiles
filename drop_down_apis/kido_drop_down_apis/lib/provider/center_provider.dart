import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kido_drop_down_apis/model/center_modal.dart';
import 'package:kido_drop_down_apis/repo/center_repo.dart';
import 'package:provider/provider.dart';

class KidoCenterProvider with ChangeNotifier {
  var repo = CenterRepo();
  List<CenterModal> centerList = [];
  List<CenterModal> get mykidoCenterList => centerList;
  Future getCenterDataByZone({required String zoneId}) async {
    var response = await repo.getCenterData(zoneId: zoneId);
    if (response['code'] == 200) {
      List<CenterModal> kidoCenterList = List<CenterModal>.from(
        response['data'].map(
          (e) => CenterModal.fromJson(e),
        ),
      );
      centerList = kidoCenterList;
      notifyListeners();
      log('=====provider success=====\n\n\n');
      log(centerList[0].agreementTermEnd!);
      notifyListeners();
    }
  }
}
