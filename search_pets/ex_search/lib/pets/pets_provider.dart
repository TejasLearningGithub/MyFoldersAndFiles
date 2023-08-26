import 'package:ex_search/pets/pets_modal.dart';
import 'package:ex_search/pets/pets_repo.dart';
import 'package:flutter/material.dart';

class PetsProvider with ChangeNotifier {
  var repo = PetsRepo();
  MyPetsModal petsModal = MyPetsModal();
  MyPetsModal get myPets => petsModal;
  MyPetsModal searchedPets = MyPetsModal(data: []);
  String searchText = '';

  Future getPetsDataWithJson() async {
    var response = await repo.getPetsData();
    petsModal = response;
    //notifyListeners();
    searchingOfPets();
  }

  Future searchingOfPets() async {
    searchedPets.data?.clear();
    if (searchText.isEmpty) {
      searchedPets.data?.addAll(petsModal.data!);
    } else {
      searchedPets.data?.addAll(petsModal.data!
          .where((element) =>
              element.userName!.toLowerCase().startsWith(searchText))
          .toList());
    }
    notifyListeners();
  }

  search(String userName) {
    searchText = userName;
    searchingOfPets();
  }
}
