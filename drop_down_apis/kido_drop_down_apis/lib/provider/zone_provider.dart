import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kido_drop_down_apis/model/zone_modal.dart';
import 'package:kido_drop_down_apis/repo/zone_repo.dart';

class ZoneProvider with ChangeNotifier {
  String? countryId;
  var repo = ZoneRepo();
  List<ZoneModal> zoneModalList = [];
  Future getZoneData({required String countryId}) async {
    var response = await repo.getZone(countryId: countryId);

    if (response['code'] == 200) {
      log('Success Response');
      List<ZoneModal> zoneList = List<ZoneModal>.from(
        response['data'].map(
          (e) => ZoneModal.fromJson(e),
        ),
      );
      zoneModalList = zoneList;
      notifyListeners();
    }
  }
}
