import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:prg_search/model/pets_modal.dart';

class PetsRepo {

  PetsModal petsModal = PetsModal(data: []);
  Future getPetsData() async {
    try {
      var response = await http.get(Uri.parse(
          'https://jatinderji.github.io/users_pets_api/users_pets.json'));
      if (response.statusCode == 200) {
        petsModal = petsFromJson(response.body);
        return petsModal;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
