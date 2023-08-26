import 'dart:convert';
import 'dart:developer';

import 'package:ex_search/pets/pets_modal.dart';
import 'package:http/http.dart' as http;

class PetsRepo {
  MyPetsModal myPetsModal = MyPetsModal(data: []);

  Future getPetsData() async {
    try {
      var response = await http.get(
        Uri.parse(
          'https://jatinderji.github.io/users_pets_api/users_pets.json',
        ),
      );
      if (response.statusCode == 200) {
        myPetsModal = petsModalFromJson(response.body);
        return myPetsModal;
      }
    } catch (e) {
      log('Error in getting response from pets modal = ${e.toString()}');
    }
  }
}
