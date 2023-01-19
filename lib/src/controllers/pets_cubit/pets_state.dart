part of 'pets_cubit.dart';

@immutable
class PetsState {
  final List<PetDataModel> allPets;
  final List<PetDataModel> allPetsViewList;
  final List<PetDataModel> adoptedPets;
  final int currentIndexOfCategory;
  final AppState loadState;

  factory PetsState.initial() => const PetsState(
      allPets: [],
      adoptedPets: [],
      allPetsViewList: [],
      loadState: AppState.inital,
      currentIndexOfCategory: -1);

  const PetsState({
    required this.allPets,
    required this.allPetsViewList,
    required this.adoptedPets,
    required this.currentIndexOfCategory,
    required this.loadState,
  });

  PetsState copyWith({
    List<PetDataModel>? allPets,
    List<PetDataModel>? allPetsViewList,
    List<PetDataModel>? adoptedPets,
    int? currentIndexOfCategory,
    AppState? loadState,
  }) {
    return PetsState(
      allPets: allPets ?? this.allPets,
      allPetsViewList: allPetsViewList ?? this.allPetsViewList,
      adoptedPets: adoptedPets ?? this.adoptedPets,
      currentIndexOfCategory:
          currentIndexOfCategory ?? this.currentIndexOfCategory,
      loadState: loadState ?? this.loadState,
    );
  }

  @override
  String toString() {
    return 'PetsState(allPets: $allPets, allPetsViewList: $allPetsViewList, adoptedPets: $adoptedPets, currentIndexOfCategory: $currentIndexOfCategory, loadState: $loadState)';
  }
}
