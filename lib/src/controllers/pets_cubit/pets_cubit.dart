import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:pet_adoption_app/src/controllers/hive_controllers.dart';
import 'package:pet_adoption_app/src/models/pet_data_model.dart';
import 'package:pet_adoption_app/src/utils/constants.dart';

part 'pets_state.dart';

class PetsCubit extends Cubit<PetsState> {
  PetsCubit() : super(PetsState.initial());

  Future<void> getDataFromApi() async {
    emit(state.copyWith(loadState: AppState.loading));
    try {
      //asynchronous delay
      await Future.delayed(const Duration(seconds: 3));
      String data =
          await rootBundle.loadString("lib/assets/database/pets.json");
      final petsjsonDecoded = jsonDecode(data);
      List<PetDataModel> pets = [];
      for (var i = 0; i < petsjsonDecoded.length; i++) {
        pets.add(PetDataModel.fromJson(petsjsonDecoded[i]));
      }
      emit(state.copyWith(
          allPets: pets, allPetsViewList: pets, loadState: AppState.success));
    } catch (e) {
      emit(state.copyWith(loadState: AppState.error));
    }
  }

  _setHistoryDataInHive() async {
    await HiveDb.clearDataFromHive();
    List<String> temp = [];
    for (var i = 0; i < state.adoptedPets.length; i++) {
      temp.add(jsonEncode(state.adoptedPets[i].toJson()));
    }
    HiveDb.setPetDataInHive(temp.toString());
  }

  getHistoryDataFromHive() async {
    String data = await HiveDb.getPetHistoryDataFromHive();
    if (data != "") {
      final temp = jsonDecode(data);
      List<PetDataModel> pets = [];

      for (var i = 0; i < temp.length; i++) {
        pets.add(PetDataModel.fromJson(temp[i]));
      }

      emit(state.copyWith(adoptedPets: pets));
    }
  }

  void addPetToHistory(PetDataModel pet) {
    //make a copy of the list
    List<PetDataModel> temp = [];
    temp.addAll(state.adoptedPets);
    temp.add(pet);
    emit(state.copyWith(adoptedPets: temp));
    _setHistoryDataInHive();
  }

  void removePetFromHistory(PetDataModel pet) {
    List<PetDataModel> temp = state.adoptedPets;
    temp.remove(pet);
    emit(state.copyWith(adoptedPets: temp));
    _setHistoryDataInHive();
  }

  void filterPets({
    required String searchedTerm,
    required String filterAccordingTo,
  }) {
    if (searchedTerm == "") {
      emit(state.copyWith(allPetsViewList: state.allPets));
      return;
    }
    if (searchedTerm.length == 1 && filterAccordingTo != "Category") {
      emit(state.copyWith(
          currentIndexOfCategory: -1, allPetsViewList: state.allPets));
      return;
    }
    List<PetDataModel> temp = [];
    for (var i = 0; i < state.allPets.length; i++) {
      if (filterAccordingTo == "Name") {
        if (state.allPets[i].name!
            .toLowerCase()
            .contains(searchedTerm.toLowerCase())) {
          temp.add(state.allPets[i]);
        }
      } else if (filterAccordingTo == "Breed") {
        if (state.allPets[i].breed!
            .toLowerCase()
            .contains(searchedTerm.toLowerCase())) {
          temp.add(state.allPets[i]);
        }
      } else if (filterAccordingTo == "Age") {
        if (state.allPets[i].age!
            .toString()
            .toLowerCase()
            .contains(searchedTerm.toLowerCase())) {
          temp.add(state.allPets[i]);
        }
      } else if (filterAccordingTo == "Category") {
        if (state.allPets[i].type!
            .toLowerCase()
            .contains(searchedTerm.toLowerCase())) {
          temp.add(state.allPets[i]);
        }
      }
      emit(state.copyWith(allPetsViewList: temp));
    }
  }

  changeCurrentPetCategoryIndex(int index) {
    emit(state.copyWith(currentIndexOfCategory: index));
  }
}
