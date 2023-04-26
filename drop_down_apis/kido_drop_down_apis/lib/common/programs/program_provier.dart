import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kido_drop_down_apis/common/programs/program_modal.dart';
import 'package:kido_drop_down_apis/common/programs/program_repo.dart';

class ProgramProvider with ChangeNotifier {
  var repo = ProgramRepo();
    List<String> selectedPrograms = [];

  List<ProgramModal> programList = [];
  List<ProgramModal> get myList => programList;
  Future getPrograms() async {
    var response = await repo.getProgramsData();
    if (response['code'] == 200) {
      List<ProgramModal> tempList = List<ProgramModal>.from(
        response['data'].map(
          (e) => ProgramModal.fromJson(e),
        ),
      );
      programList = tempList;
      notifyListeners();
      log('Response Success');
      notifyListeners();
    }
  }
}
