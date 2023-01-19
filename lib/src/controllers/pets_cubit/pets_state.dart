part of 'pets_cubit.dart';

@immutable
class PetsState {
  final List<PetDataModel> allPets;
  final List<PetDataModel> adoptedPets;
  final AppState loadState;

  factory PetsState.initial() => const PetsState(
        allPets: [],
        adoptedPets: [],
        loadState: AppState.inital,
      );

  const PetsState({
    required this.allPets,
    required this.adoptedPets,
    required this.loadState,
  });

  PetsState copyWith({
    List<PetDataModel>? allPets,
    List<PetDataModel>? adoptedPets,
    AppState? loadState,
  }) {
    return PetsState(
      allPets: allPets ?? this.allPets,
      adoptedPets: adoptedPets ?? this.adoptedPets,
      loadState: loadState ?? this.loadState,
    );
  }

  @override
  String toString() =>
      'PetsState(allPets: $allPets, adoptedPets: $adoptedPets, loadState: $loadState)';
}
