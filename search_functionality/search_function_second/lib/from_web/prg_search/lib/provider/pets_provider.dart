import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:prg_search/model/pets_modal.dart';
import 'package:prg_search/repository/pets_repo.dart';

class PetsProvider with ChangeNotifier {
  var repo = PetsRepo();
  bool isLoading = true;
  String error = '';
  //List<PetsModal> myListOfPets = [];
  //List<PetsModal> get myGetterList =>myListOfPets;
  PetsModal petsModal = PetsModal();
  PetsModal get myPetsModal => petsModal;
  PetsModal searchedPets = PetsModal(data: []);
  String searchText = '';
  Future getPetsData() async {
    var response = await repo.getPetsData();
    log(response.toString());
    petsModal = response;
    notifyListeners();
    isLoading = false;
    //notifyListeners();
    updateData();
  }

  updateData() {
    searchedPets.data?.clear();
    if (searchText.isEmpty) {
      searchedPets.data?.addAll(petsModal.data!);
    } else {
      searchedPets.data?.addAll(
        petsModal.data!
            .where((element) =>
                element.userName!.toLowerCase().startsWith(searchText))
            .toList(),
      );
    }
    notifyListeners();
  }

  search(String username) {
    searchText = username;
    updateData();
  }
}
