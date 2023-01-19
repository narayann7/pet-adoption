import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';
import 'package:pet_adoption_app/src/controllers/pets_cubit/pets_cubit.dart';
import 'package:pet_adoption_app/src/utils/common_function.dart';
import 'package:pet_adoption_app/src/utils/constants.dart';
import 'package:pet_adoption_app/src/views/common.dart';
import 'package:pet_adoption_app/src/views/details.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  static const String routeName = '/home';

  static MaterialPageRoute getNavigator() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: "/home"),
        builder: (c) {
          return const HomeView();
        });
  }

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<String> filter = [
    "Breed",
    "Age",
    "Name",
  ];
  List<String> category = [
    "Dog",
    "Cat",
    "Rabbit",
    "Parrot",
  ];
  String dropdownvalue = 'Breed';
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PetsCubit, PetsState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
              backgroundColor: Theme.of(context).backgroundColor,
              appBar: const CustomAppBar(),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        color: Colors.transparent,
                        height: MediaQuery.of(context).size.height * 0.233,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                "Find your pet",
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Container(
                                height: 50,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  children: [
                                    const Icon(LineIcons.search),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: TextField(
                                        controller: searchController,
                                        onChanged: (value) {
                                          context.read<PetsCubit>().filterPets(
                                              searchedTerm: value,
                                              filterAccordingTo: dropdownvalue);
                                        },
                                        decoration: const InputDecoration(
                                            hintText: "Search",
                                            border: InputBorder.none),
                                      ),
                                    ),
                                    DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        value: dropdownvalue,
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 16),
                                        elevation: 16,
                                        enableFeedback: true,
                                        icon: const Icon(
                                          LineIcons.filter,
                                          size: 22,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                        items: filter.map((String items) {
                                          return DropdownMenuItem(
                                            value: items,
                                            child: CustomText(items),
                                          );
                                        }).toList(),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            dropdownvalue = newValue!;
                                          });
                                          context.read<PetsCubit>().filterPets(
                                              searchedTerm:
                                                  searchController.text,
                                              filterAccordingTo:
                                                  newValue.toString());
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              CustomText(
                                "Pet Categories",
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 40,
                                child: ListView.builder(
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        if (state.currentIndexOfCategory !=
                                            index) {
                                          context
                                              .read<PetsCubit>()
                                              .changeCurrentPetCategoryIndex(
                                                  index);
                                          context.read<PetsCubit>().filterPets(
                                              searchedTerm:
                                                  category[index].toLowerCase(),
                                              filterAccordingTo: "Category");
                                        } else {
                                          context
                                              .read<PetsCubit>()
                                              .changeCurrentPetCategoryIndex(
                                                  -1);
                                          context.read<PetsCubit>().filterPets(
                                              searchedTerm: "",
                                              filterAccordingTo: "Category");
                                        }
                                      },
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(right: 10),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        decoration: BoxDecoration(
                                            color:
                                                state.currentIndexOfCategory !=
                                                        index
                                                    ? Colors.grey[200]
                                                    : Theme.of(context)
                                                        .primaryColor,
                                            border: Border.all(
                                                color:
                                                    state.currentIndexOfCategory ==
                                                            index
                                                        ? Theme.of(context)
                                                            .dividerColor
                                                        : Colors.transparent),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Center(
                                            child: CustomText(category[index],
                                                color:
                                                    state.currentIndexOfCategory !=
                                                            index
                                                        ? Colors.grey[600]
                                                        : Colors.black)),
                                      ),
                                    );
                                  },
                                  itemCount: category.length,
                                  scrollDirection: Axis.horizontal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.65,
                          width: MediaQuery.of(context).size.width,
                          child: state.loadState == AppState.loading
                              ? petShimmerCard(context)
                              : ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: state.allPetsViewList.length,
                                  itemBuilder: (context, index) {
                                    return SinglePet(
                                      onTap: () {
                                        FocusScope.of(context).unfocus();
                                        moveToNextScreenWithArguments(
                                            context,
                                            PetDetailsView.routeName,
                                            state.allPetsViewList[index]);
                                      },
                                      petDataModel:
                                          state.allPetsViewList[index],
                                    );
                                  },
                                )),
                    ],
                  ),
                ),
              ) // Cente
              ),
        );
      },
    );
  }
}
